import {Customer} from "./customer";

export interface Card {
  id: number;
  cardNumber: string;
  maximumLimit: number;
  expiryDate: Date;
  customer: Customer;
}
