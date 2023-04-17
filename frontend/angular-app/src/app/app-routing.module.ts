import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import {LoginComponent} from "./componets/login/login.component";
import {SignupComponent} from "./componets/signup/signup.component";
import {AdministratorComponent} from "./componets/administrator/administrator.component";
import {AuthGuard} from "./services/auth.guard";
import {HomeComponent} from "./componets/home/home.component";

const routes: Routes = [
  {path: 'login', component: LoginComponent},
  {path: 'signup', component: SignupComponent},
  {path: 'review', component: HomeComponent},
  {path: 'admin', component: AdministratorComponent/*, canActivate: [AuthGuard]*/}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
