package dk.nikolaj.securityexam.services;

import dk.nikolaj.securityexam.entities.BankTransaction;
import dk.nikolaj.securityexam.repositories.BankTransactionRepository;
import dk.nikolaj.securityexam.services.interfaces.BankTransactionService;
import javax.transaction.Transactional;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@Transactional
public class BankTransactionServiceImpl implements BankTransactionService {

    private final BankTransactionRepository bankTransactionRepository;

    public BankTransactionServiceImpl(BankTransactionRepository bankTransactionRepository) {
        this.bankTransactionRepository = bankTransactionRepository;
    }

    public List<BankTransaction> listAllBankTransactions() {
        return bankTransactionRepository.findAll();
    }

    public BankTransaction getBankTransaction(Long id) {
        return bankTransactionRepository.findById(id).get();
    }

    public void saveBankTransaction(BankTransaction bankTransaction) {
        bankTransactionRepository.save(bankTransaction);
    }

    public void deleteBankTransaction(Long id) {
        bankTransactionRepository.deleteById(id);
    }
}
