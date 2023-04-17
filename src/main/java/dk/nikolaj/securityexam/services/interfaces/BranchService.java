package dk.nikolaj.securityexam.services.interfaces;

import dk.nikolaj.securityexam.entities.Branch;

import java.util.List;

public interface BranchService {

    List<Branch> listAllBranches();

    Branch getBranch(Long id);

    void saveBranch(Branch branch);

    void deleteBranch(Long id);
}
