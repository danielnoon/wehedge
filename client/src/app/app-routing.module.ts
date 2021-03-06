import { NgModule } from '@angular/core';
import { PreloadAllModules, RouterModule, Routes } from '@angular/router';
import { RootGuard } from "./root.guard";
import { HomeGuard } from "./home/home.guard";

const routes: Routes = [
  {
    path: 'home',
    loadChildren: () => import('./home/home.module').then( m => m.HomePageModule),
    canActivate: [HomeGuard]
  },
  {
    path: '',
    redirectTo: 'home',
    pathMatch: 'full',
    canActivate: [RootGuard]
  },
  {
    path: 'login',
    loadChildren: () => import('./login/login.module').then( m => m.LoginPageModule)
  },
  {
    path: 'register',
    loadChildren: () => import('./register/register.module').then( m => m.RegisterPageModule)
  },
  {
    path: 'groups',
    loadChildren: () => import('./groups/groups.module').then( m => m.GroupsPageModule)
  },
  {
    path: 'groups/new',
    loadChildren: () => import('./create-group/create-group.module').then( m => m.CreateGroupPageModule),
    pathMatch: 'full'
  },
  {
    path: 'groups/:id',
    loadChildren: () => import('./group-details/group-details.module').then( m => m.GroupDetailsPageModule)
  },
  {
    path: 'groups/:id/join',
    loadChildren: () => import('./join/join.module').then( m => m.JoinPageModule)
  },




];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule { }
