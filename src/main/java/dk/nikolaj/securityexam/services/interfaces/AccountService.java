package dk.nikolaj.securityexam.services.interfaces;

import dk.nikolaj.securityexam.entities.Account;

import java.util.List;

public interface AccountService {

    List<Account> listAllAccounts();

    Account getAccount(Long id);

    void saveAccount(Account account);

    void deleteAccount(Long id);
}
