package dk.nikolaj.securityexam.services.interfaces;

import dk.nikolaj.securityexam.entities.BankTransaction;

import java.util.List;

public interface BankTransactionService {

    List<BankTransaction> listAllBankTransactions();

    BankTransaction getBankTransaction(Long id);

    void saveBankTransaction(BankTransaction bankTransaction);

    void deleteBankTransaction(Long id);
}
