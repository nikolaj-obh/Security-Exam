package dk.nikolaj.securityexam.services.interfaces;

import dk.nikolaj.securityexam.entities.Loan;

import java.util.List;

public interface LoanService {

    List<Loan> listAllLoans();

    Loan getLoan(Long id);

    void saveLoan(Loan loan);

    void deleteLoan(Long id);
}
