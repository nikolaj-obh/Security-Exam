package dk.nikolaj.securityexam.services;

import dk.nikolaj.securityexam.entities.Account;
import dk.nikolaj.securityexam.repositories.AccountRepository;
import dk.nikolaj.securityexam.services.interfaces.AccountService;
import javax.transaction.Transactional;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@Transactional
public class AccountServiceImpl implements AccountService {

    private final AccountRepository accountRepository;

    public AccountServiceImpl(AccountRepository accountRepository) {
        this.accountRepository = accountRepository;
    }

    public List<Account> listAllAccounts() {
        return accountRepository.findAll();
    }

    public Account getAccount(Long id) {
        return accountRepository.findById(id).get();
    }

    public void saveAccount(Account account) {
        accountRepository.save(account);
    }

    public void deleteAccount(Long id) {
        accountRepository.deleteById(id);
    }
}
