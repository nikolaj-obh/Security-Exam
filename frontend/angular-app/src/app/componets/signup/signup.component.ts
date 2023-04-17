import { Component } from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from "@angular/forms";
import {AuthService} from "../../services/auth.service";
import {Router} from "@angular/router";

@Component({
  selector: 'app-signup',
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.css']
})
export class SignupComponent {

  signupForm = new FormGroup({
    name: new FormControl(null, Validators.required),
    email: new FormControl(null, Validators.required),
    password: new FormControl(null, Validators.required),
    confirmedPassword: new FormControl(null, Validators.required)
  });

  constructor(private authService: AuthService, private router: Router, private formBuilder: FormBuilder) {
  }

  submitForm(){
    if(this.signupForm.invalid){
      return;
    }

    const user = {email: this.signupForm.get('email')?.value, password: this.signupForm.get('password')?.value/*, name: this.signupForm.get('name')?.value*/}

    this.authService
      .register(user)
      .subscribe((response) => {
      this.router.navigate(['/']);
    });

/*    const credential = {email: this.signupForm.get('email')?.value, password: this.signupForm.get('password')?.value}

    this.authService
      .login(credential)
      .subscribe((response) => {
        this.router.navigate(['/']);
      });*/
  }
}
