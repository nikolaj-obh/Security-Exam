package dk.nikolaj.securityexam.controllers;

import dk.nikolaj.securityexam.entities.Loan;
import dk.nikolaj.securityexam.services.interfaces.LoanService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.NoSuchElementException;

@RestController
@RequestMapping("/loans")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class LoanController {

    private final LoanService loanService;

    public LoanController(LoanService loanService) {
        this.loanService = loanService;
    }

    @GetMapping("")
    public List<Loan> list() {
        return loanService.listAllLoans();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Loan> get(@PathVariable Long id) {
        try {
            Loan loan = loanService.getLoan(id);
            return new ResponseEntity<Loan>(loan, HttpStatus.OK);
        } catch (NoSuchElementException e) {
            return new ResponseEntity<Loan>(HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping("/")
    public void add(@RequestBody Loan loan) {
        loanService.saveLoan(loan);
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> update(@RequestBody Loan loan, @PathVariable Long id) {
        try {
            Loan existLoan = loanService.getLoan(id);
            loan.setID(id);
            loanService.saveLoan(loan);
            return new ResponseEntity<>(HttpStatus.OK);
        } catch (NoSuchElementException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable Long id) {

        loanService.deleteLoan(id);
    }
}
