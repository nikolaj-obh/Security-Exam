import {Customer} from "./customer";

export interface Loan {
  id: number;
  durationInYears: number;
  loanStartDate: Date;
  interestRate: number;
  loanAmountTaken: number;
  loanAmountRepaid: number;
  loanType: string;
  customer: Customer;
}
