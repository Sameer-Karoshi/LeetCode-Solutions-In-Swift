/*
Definition of Node:
struct Node {
    int data;
    Node* left;
    Node* right;

    Node(int val) {
        data = val;
        left = right = NULL;
    }
};
*/

class Solution {
public:
    int findCeil(Node* root, int key) {
        int ceil = -1;  // Initialize ceil as -1 (if not found)

        // Traverse the BST using while loop
        while (root != NULL) {
            
            // If exact match found, that's the ceil
            if (root->data == key) {
                return root->data;
            }

            // If current node value is less than key
            if (root->data < key) {
                // Move to right subtree (larger values)
                root = root->right;
            } 
            else {
                // Current node can be a potential ceil
                ceil = root->data;

                // Move to left subtree to find smaller possible ceil
                root = root->left;
            }
        }

        return ceil;  // Return the final ceil value
    }
};
