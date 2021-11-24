def all_equal(input_list):
    if len(input_list) <= 1:
        return True
    head = input_list[0]
    for elem in input_list:
        if head != elem:
            return False
    return True

def tree_sum(tree):
    if isinstance(tree, Leaf):
        return tree.value
    elif isinstance(tree, InternalNode):
        left_sum = tree_sum(tree.left)
        right_sum = tree_sum(tree.right)
        return left_sum + right_sum
