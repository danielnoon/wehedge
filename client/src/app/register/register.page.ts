import { Component, OnInit } from '@angular/core';
import { ApiService } from "../api.service";
import { Router } from "@angular/router";

@Component({
  selector: 'app-register',
  templateUrl: './register.page.html',
  styleUrls: ['./register.page.scss'],
})
export class RegisterPage implements OnInit {
  username: string;
  password: string;
  firstName: string;
  lastName: string;

  constructor(private api: ApiService, private router: Router) {}

  ngOnInit() {}

  async submit() {
    const { username, password, firstName, lastName } = this;

    const { id, token } = await this.api.register({
      username, password, firstName, lastName
    });

    localStorage.setItem('id', id.toString());
    localStorage.setItem('token', token);

    await this.router.navigate(['/home']);
  }
}
