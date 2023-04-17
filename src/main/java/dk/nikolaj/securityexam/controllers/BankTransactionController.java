package dk.nikolaj.securityexam.controllers;

import dk.nikolaj.securityexam.entities.BankTransaction;
import dk.nikolaj.securityexam.services.interfaces.BankTransactionService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.NoSuchElementException;

@RestController
@RequestMapping("/banking-transactions")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class BankTransactionController {

    private final BankTransactionService bankTransactionService;

    public BankTransactionController(BankTransactionService bankTransactionService) {
        this.bankTransactionService = bankTransactionService;
    }

    @GetMapping("")
    public List<BankTransaction> list() {
        return bankTransactionService.listAllBankTransactions();
    }

    @GetMapping("/{id}")
    public ResponseEntity<BankTransaction> get(@PathVariable Long id) {
        try {
            BankTransaction bankTransaction = bankTransactionService.getBankTransaction(id);
            return new ResponseEntity<BankTransaction>(bankTransaction, HttpStatus.OK);
        } catch (NoSuchElementException e) {
            return new ResponseEntity<BankTransaction>(HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping("/")
    public void add(@RequestBody BankTransaction bankTransaction) {
        bankTransactionService.saveBankTransaction(bankTransaction);
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> update(@RequestBody BankTransaction bankTransaction, @PathVariable Long id) {
        try {
            BankTransaction existBankTransaction = bankTransactionService.getBankTransaction(id);
            bankTransaction.setTransactionID(id);
            bankTransactionService.saveBankTransaction(bankTransaction);
            return new ResponseEntity<>(HttpStatus.OK);
        } catch (NoSuchElementException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable Long id) {

        bankTransactionService.deleteBankTransaction(id);
    }
}
