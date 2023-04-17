package dk.nikolaj.securityexam.services.interfaces;

import dk.nikolaj.securityexam.entities.Customer;

import java.util.List;

public interface CustomerService {

    List<Customer> listAllCustomers();

    Customer getCustomer(Long id);

    void saveCustomer(Customer customer);

    void deleteCustomer(Long id);
}
