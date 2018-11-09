import Foundation
import XCTest

contract MultiSigWallet {
    struct Proposal {
        uint256 amount;
        address signer;
        address destination;
        bool signed;
    }
    
    address[4] signers;
    mapping(address => Proposal) signer_proposals;
    
    function MultiSigWallet(address init_signer0, address init_signer1, address init_signer2, address init_signer3) public {
        signers = [init_signer0, init_signer1, init_signer2, init_signer3];
        
        signer_proposals[signers[0]] = Proposal({
            amount: 0,
            signer: signers[0],
            destination: 0x0,
            signed: false
        });
        signer_proposals[signers[1]] = Proposal({
            amount: 0,
            signer: signers[1],
            destination: 0x0,
            signed: false
        });
        signer_proposals[signers[2]] = Proposal({
            amount: 0,
            signer: signers[2],
            destination: 0x0,
            signed: false
        });
        signer_proposals[signers[3]] = Proposal({
            amount: 0,
            signer: signers[3],
            destination: 0x0,
            signed: false
        });
    }
    
    function () external payable {}
    
    function withdraw(address proposed_destination, uint256 proposed_amount) external {
        require(proposed_amount <= this.balance);
        
        signer_proposals[msg.sender].amount = proposed_amount;
        signer_proposals[msg.sender].destination = proposed_destination;
        signer_proposals[msg.sender].signed = true;
        
        bool two_signers;
        address first_signer = msg.sender;
        address second_signer;
        
        // Figure out which if another signed
        if (also_signed(0)) {
            two_signers = true;
            second_signer = signers[0];
        } else if (also_signed(1)) {
            two_signers = true;
            second_signer = signers[1];
        } else if (also_signed(2)) {
            two_signers = true;
            second_signer = signers[2];
        } else if (also_signed(3)) {
            two_signers = true;
            second_signer = signers[3];
        }
        
        // If not, just exit the function quietly and wait for the second signer.
        if (two_signers) {
            // The two signers must agree exactly.
            require(signer_proposals[first_signer].amount == signer_proposals[second_signer].amount);
            require(signer_proposals[first_signer].destination == signer_proposals[second_signer].destination);
            
            // "Unsign" all of the proposals.
            signer_proposals[first_signer].signed = false;
            signer_proposals[second_signer].signed = false;
            
            // Actually withdraw the money.
            signer_proposals[first_signer].destination.transfer(signer_proposals[first_signer].amount);
        }
    }
    
    function also_signed(uint index) internal view returns(bool) {
        return signer_proposals[signers[index]].signed;
    }
}
