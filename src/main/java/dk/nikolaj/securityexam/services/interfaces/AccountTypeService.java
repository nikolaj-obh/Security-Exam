package dk.nikolaj.securityexam.services.interfaces;

import dk.nikolaj.securityexam.entities.AccountType;

import java.util.List;

public interface AccountTypeService {

    List<AccountType> listAllAccountTypes();

    AccountType getAccountType(Long id);

    void saveAccountType(AccountType accountType);

    void deleteAccountType(Long id);
}
