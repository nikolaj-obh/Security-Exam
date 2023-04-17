package dk.nikolaj.securityexam.services;

import dk.nikolaj.securityexam.entities.Loan;
import dk.nikolaj.securityexam.repositories.LoanRepository;
import dk.nikolaj.securityexam.services.interfaces.LoanService;
import javax.transaction.Transactional;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@Transactional
public class LoanServiceImpl implements LoanService {

    private final LoanRepository loanRepository;

    public LoanServiceImpl(LoanRepository loanRepository) {
        this.loanRepository = loanRepository;
    }

    public List<Loan> listAllLoans() {
        return loanRepository.findAll();
    }

    public Loan getLoan(Long id) {
        return loanRepository.findById(id).get();
    }

    public void saveLoan(Loan loan) {
        loanRepository.save(loan);
    }

    public void deleteLoan(Long id) {
        loanRepository.deleteById(id);
    }
}
