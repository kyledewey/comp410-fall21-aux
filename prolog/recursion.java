public class recursion {
    // [1, 2, 3, 4]
    // 1 + 2 + 3 + 4
    public static int sum1(int[] array, int index) {
        if (index < 0 || index >= array.length) {
            return 0;
        } else {
            int rest = sum1(array, index + 1);
            // last thing: adds rest
            return rest + array[index];
        }
    }

    // tail recursion optimization
    public static int sum2(int[] array, int index, int accumulator) {
        if (index < 0 || index >= array.length) {
            return accumulator;
        } else {
            // last thing: calls itself recursively
            // tail recursion
            return sum2(array, index + 1, accumulator + array[index]);
        }
    }

    public static int sum2(int[] array, int index) {
        return sum2(array, index, 0);
    }
}
