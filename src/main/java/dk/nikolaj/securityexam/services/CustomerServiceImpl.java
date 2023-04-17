package dk.nikolaj.securityexam.services;

import dk.nikolaj.securityexam.entities.Customer;
import dk.nikolaj.securityexam.repositories.CustomerRepository;
import dk.nikolaj.securityexam.services.interfaces.CustomerService;
import javax.transaction.Transactional;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@Transactional
public class CustomerServiceImpl implements CustomerService {

    private final CustomerRepository customerRepository;

    public CustomerServiceImpl(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }

    public List<Customer> listAllCustomers() {
        return customerRepository.findAll();
    }

    public Customer getCustomer(Long id) {
        return customerRepository.findById(id).get();
    }

    public void saveCustomer(Customer customer) {
        customerRepository.save(customer);
    }

    public void deleteCustomer(Long id) {
        customerRepository.deleteById(id);
    }
}
