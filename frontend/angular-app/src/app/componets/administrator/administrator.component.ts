import {Component, OnInit} from '@angular/core';
import {User} from "../../models/user";
import {UserService} from "../../services/user.service";
import {HttpErrorResponse} from "@angular/common/http";
import {AuthService} from "../../services/auth.service";
import {BehaviorSubject, tap} from "rxjs";
import {AppComponent} from "../../app.component";

@Component({
  selector: 'app-administrator',
  templateUrl: './administrator.component.html',
  styleUrls: ['./administrator.component.css']
})
export class AdministratorComponent implements OnInit{
  public users: User[] = [];
  public editUser: User | undefined;
  public deleteUser: User | undefined;

  public isLoggedIn = this.authService.isLoggedIn

  constructor(private userService: UserService, private authService: AuthService){}

  ngOnInit() {
    this.getUsers();
  }

  public getUsers(): void {
    this.userService.getUsers().subscribe({
      next: (response: User[]) => {
        this.users = response;
      },
      error: (error: HttpErrorResponse) => {
        alert(error.message);
      }
    })
  }

  public onOpenModal(mode: string, user?: User): void {
    const container = document.getElementById('main-container');
    const button = document.createElement('button');
    button.type = 'button';
    button.style.display = 'none';
    button.setAttribute('data-toggle', 'modal');
    if (mode === 'delete') {
      this.deleteUser = user;
      button.setAttribute('data-target', '#deleteUserModal');
    } else if (mode === 'edit') {
      this.editUser = user;
      button.setAttribute('data-target', '#editUserModal');
    }

    container?.appendChild(button);
    button.click();
  }

  /*  public onAddEmployee(addForm: NgForm): void {
      document.getElementById('add-employee-form')?.click();
      this.employeeService.addEmployee(addForm.value).subscribe({
        next: (response: Employee) => {
          console.log(response);
          this.getUsers();
          addForm.reset();
        },
        error: (error: HttpErrorResponse) => {
          alert(error.message);
          addForm.reset();
        }
      })
    }*/

  public onUpdateUser(user: User): void {
    this.editUser = user;
    this.userService.updateUser(user).subscribe({
      next: (response: User) => {
        console.log(response);
        this.getUsers();
      },
      error: (error: HttpErrorResponse) => {
        alert(error.message);
      }
    })
  }

  public onDeleteUser(userId: number): void {
    this.userService.deleteUser(userId).subscribe({
      next: (response: void) => {
        console.log(response);
        this.getUsers();
      },
      error: (error: HttpErrorResponse) => {
        alert(error.message);
      }
    })
  }

  public searchUsers(key: string): void {
    const results: User[] = [];
    for (const user of this.users) {
      if (user.email.toLowerCase().indexOf(key.toLowerCase()) !== -1) {
        results.push(user);
      }
    }

    this.users = results;
    if (results.length === 0 || !key) {
      this.getUsers();
    }
  }
}
