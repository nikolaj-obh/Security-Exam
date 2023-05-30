import {Branch} from "./branch";
import {AccountType} from "./account-type";

export interface Account {
  id: number;
  accountBalance: number;
  dateOpened: Date;
  accountType: AccountType;
  branch: Branch;
  }
