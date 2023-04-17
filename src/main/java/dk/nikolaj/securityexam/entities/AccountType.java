package dk.nikolaj.securityexam.entities;

import javax.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "account_type")
public class AccountType {

    @Id
    private String accountType;
    @Column(name = "minimum_balance_restriction")
    private BigDecimal minimumBalanceRestriction;
}
