package dk.nikolaj.securityexam.services;

import dk.nikolaj.securityexam.entities.AccountType;
import dk.nikolaj.securityexam.repositories.AccountTypeRepository;
import dk.nikolaj.securityexam.services.interfaces.AccountTypeService;
import javax.transaction.Transactional;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@Transactional
public class AccountTypeServiceImpl implements AccountTypeService {

    private final AccountTypeRepository accountTypeRepository;

    public AccountTypeServiceImpl(AccountTypeRepository accountTypeRepository) {
        this.accountTypeRepository = accountTypeRepository;
    }

    public List<AccountType> listAllAccountTypes() {
        return accountTypeRepository.findAll();
    }

    public AccountType getAccountType(Long id) {
        return accountTypeRepository.findById(id).get();
    }

    public void saveAccountType(AccountType accountType) {
        accountTypeRepository.save(accountType);
    }

    public void deleteAccountType(Long id) {
        accountTypeRepository.deleteById(id);
    }
}
