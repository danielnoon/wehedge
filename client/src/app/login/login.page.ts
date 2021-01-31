import { Component, OnInit } from '@angular/core';
import { ApiService } from "../api.service";
import { Router } from "@angular/router";

@Component({
  selector: "app-login",
  templateUrl: "./login.page.html",
  styleUrls: ["./login.page.scss"],
})
export class LoginPage implements OnInit {
  username: string;
  password: string;

  constructor(private api: ApiService, private router: Router) {}

  ngOnInit() {}

  async submit() {
    const username = this.username;
    const password = this.password;

    const { id, token } = await this.api.login({
      username, password
    });

    localStorage.setItem('id', id.toString());
    localStorage.setItem('token', token);

    await this.router.navigate(['/home']);
  }
}

