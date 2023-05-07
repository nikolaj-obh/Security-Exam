import {Component, OnInit} from '@angular/core';
import {AuthService} from "../../services/auth.service";
import {HttpClient} from "@angular/common/http";
import {User} from "../../models/user";

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
  currentUser: User;

  //selectedFile = null;

  public isLoggedIn = this.authService.isLoggedIn
  constructor(private authService: AuthService) {}

  ngOnInit(): void {
    this.authService.getCurrentUser().subscribe((user: User) => {
      this.currentUser = user;
    });
  }
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
