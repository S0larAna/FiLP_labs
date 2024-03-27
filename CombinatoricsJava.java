import java.util.Arrays;
import java.util.Collections;

public class CombinatoricsJava {

    public static char nextSymbol(char curChar, int n, char[] alphabet){
        int i =0;
        while(i<n && curChar!=alphabet[i]){
            i++;
        }
        return alphabet[i+1];
    }

    public static int nextSymbolInt(int curSymbol, int n, int[] alphabet) {
        int i = 0;
        while ((i < n) && (alphabet[i] != curSymbol)) i++;
        return alphabet[i + 1];
    }

    public static boolean nextPlacement(char[] array, int n, int k, char[] alphabet){
        int j = k - 1;
        while((j>=0)&&(array[j]==alphabet[n-1])){
            j--;
        }
        if (j<0){
            return false;
        }
        array[j] = nextSymbol(array[j], n, alphabet);
        for (int i=j+1; i<k; i++){
            array[i] = alphabet[0];
        }
        return true;
    }

    public static void printAllPlacements(char[] alphabet, int n, int k, char[] array){
        for (int i=0; i<k; i++){
            array[i] = alphabet[0];
            System.out.print(array[i]);
        }
        System.out.println();

        while (nextPlacement(array, n, k, alphabet)){
            for (int i=0; i<k; i++){
                System.out.print(array[i]);
            }
            System.out.println();
        }
    }

    // напечатать все размещения из алфавита длины n по k символов с повторениями рекурсивной функцией
    public static void printPlacementsRecursive(char[] array,int n,int k, char[] alphabet, int curPos) {
        if (curPos == k) {
            for (int i = 0; i < k; i++) {
                System.out.print(array[i]);
            }
            System.out.println();
        } else {
            for (int i = 0; i < n; i++) {
                array[curPos] = alphabet[i];
                printPlacementsRecursive(array,n,k,alphabet,curPos + 1);
            }
        }
    }

    public static boolean nextCombination(char[] array, int n, int k, char[] alphabet){
        int j = k - 1;
        int l = 1;

        while ((j >= 0) && (array[j] == alphabet[n - l])) {
            j--;
            l++;
        }
        if (j<0){ return false;}
        else {
            array[j] = nextSymbol(array[j], n, alphabet);
            for (int i = j + 1; i < k; i++) {
                array[i] = nextSymbol(array[i - 1], n, alphabet);
            }
            return true;
        }
    }

    public static void printAllCombinations(char[] array, int n, int k, char[] alphabet){
        for (int i = 0; i<k; i++){
            array[i] = alphabet[i];
            System.out.print(array[i]);
        }
        System.out.println();
        while(nextCombination(array, n, k, alphabet)){
            for (int i = 0; i<k; i++){
                System.out.print(array[i]);
            }
            System.out.println();
        }
    }


    public static void main(String[] args) {
        System.out.println("Hello and welcome!");
        int n = 5;
        int k = 3;

        char[] array1 = new char[k];
        char[] alphabet = new char[n];
        alphabet[0] = 'a';
        alphabet[1] = 'b';
        alphabet[2] = 'c';
        alphabet[3] = 'd';
        alphabet[4] = 'e';
        printAllCombinations(array1, n, k, alphabet);

    }
}
