package dk.nikolaj.securityexam.services.interfaces;

import dk.nikolaj.securityexam.entities.CardTransaction;

import java.util.List;

public interface CardTransactionService {

    List<CardTransaction> listAllCardTransactions();

    CardTransaction getCardTransaction(Long id);

    void saveCardTransaction(CardTransaction cardTransaction);

    void deleteCardTransaction(Long id);
}
