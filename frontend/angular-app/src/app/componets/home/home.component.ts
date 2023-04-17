import { Component } from '@angular/core';
import {AuthService} from "../../services/auth.service";
import {HttpClient} from "@angular/common/http";

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent {
  //selectedFile = null;

  public isLoggedIn = this.authService.isLoggedIn
  constructor(public authService: AuthService) {}
/*
  onFileSelected(event: any){
    this.selectedFile = event.taget.files[0];
  }

  onUpload(){
    const data = new FormData();
    //data.append('image', this)
    //this.http.post()
  }*/
}
