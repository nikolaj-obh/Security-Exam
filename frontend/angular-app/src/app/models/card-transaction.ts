export interface CardTransaction {
  id: number;
  cardNumber: string;
  transactionDate: Date;
  amount: number;
  merchantDetails: string;
}
