package dk.nikolaj.securityexam.controllers;

import dk.nikolaj.securityexam.entities.Branch;
import dk.nikolaj.securityexam.services.interfaces.BranchService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.NoSuchElementException;

@RestController
@RequestMapping("/api/branches")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class BranchController {

    private final BranchService branchService;

    public BranchController(BranchService branchService) {
        this.branchService = branchService;
    }

    @GetMapping("")
    public List<Branch> list() {
        return branchService.listAllBranches();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Branch> get(@PathVariable Long id) {
        try {
            Branch branch = branchService.getBranch(id);
            return new ResponseEntity<>(branch, HttpStatus.OK);
        } catch (NoSuchElementException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping("/")
    public void add(@RequestBody Branch branch) {
        branchService.saveBranch(branch);
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> update(@RequestBody Branch branch, @PathVariable Long id) {
        try {
            Branch existBranch = branchService.getBranch(id);
            branch.setID(id);
            branchService.saveBranch(branch);
            return new ResponseEntity<>(HttpStatus.OK);
        } catch (NoSuchElementException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable Long id) {

        branchService.deleteBranch(id);
    }
}
