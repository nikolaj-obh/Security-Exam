import {Customer} from "./customer";

export interface BankTransaction {
  id: number;
  transactionType: string;
  description: string;
  amount: number;
  transactionDate: Date;
  customer: Customer;
}
