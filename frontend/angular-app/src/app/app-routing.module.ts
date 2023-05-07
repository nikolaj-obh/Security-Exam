import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import {LoginComponent} from "./componets/login/login.component";
import {SignupComponent} from "./componets/signup/signup.component";
import {AdministratorComponent} from "./componets/administrator/administrator.component";
import {AuthGuard} from "./services/auth.guard";
import {HomeComponent} from "./componets/home/home.component";
import {PageNotFoundComponent} from "./componets/page-not-found/page-not-found.component";

const routes: Routes = [
  {path: 'login', component: LoginComponent},
  {path: 'signup', component: SignupComponent},
  {path: 'home', component: HomeComponent},
  {path: 'admin', component: AdministratorComponent/*, canActivate: [AuthGuard]*/},
  {path: '',   redirectTo: '/login', pathMatch: 'full'},
  {path: '**', component: PageNotFoundComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
