import { Component } from '@angular/core';
import {FormControl, FormGroup, Validators} from "@angular/forms";
import {AuthService} from "../../services/auth.service";
import {Router} from "@angular/router";

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent {

  loginForm = new FormGroup({
    email: new FormControl(null, [Validators.required, Validators.email]),
    password: new FormControl(null, Validators.required)
  });

  constructor(private authService: AuthService, private router: Router) {
  }

  submitForm(){
    if(this.loginForm.invalid){
      return;
    }

    const credentials = {email: this.loginForm.get('email')?.value,
      password: this.loginForm.get('password')?.value}

    this.authService
      .login(credentials)
      .subscribe((response) => {
        this.router.navigate(['/home']);
      });
  }
}
