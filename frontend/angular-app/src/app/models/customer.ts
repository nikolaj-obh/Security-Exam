import {Loan} from "./loan";

export interface Customer {
  id: number;
  firstName: string;
  lastName: string;
  gender: string;
  birthday: Date;
  address: string;
  city: string;
  state: string;
  zipCode: number;
  email: string;
  username: string;
  password: string;
  loans: Loan[];
}
