package Lab5

class RecursionUpAndDown {
    fun max3(x: Int, y: Int, z: Int): Int = if (x > y) if (x > z) x else z else if (y > z) y else z

    fun fact(n:Int):Int = if (n==0) 1 else n*fact(n-1)

    fun factDown(n:Int):Int = factDownHelper(n, 1)
    tailrec fun factDownHelper(n:Int, fact:Int): Int{
        return if (n<=1) fact
        else factDownHelper(n-1, n*fact)
    }
    tailrec fun countDivsDown(x:Int, count:Int, div:Int): Int{
        return if (x>div) {
            if (x % div == 0) countDivsDown(x, count+1, div+1)
            else countDivsDown(x, count, div+1)
        }
        else count
    }
    fun countDivs(x: Int): Int = countDivsDown(x, 1, 1)

    fun process(list: List<Int>, predicate: (Int) -> Boolean, transform: (Int) -> Int): List<Int>{
        return list.filter(predicate).map(transform)
    }

    fun createFunction(flag: Boolean): (Int) -> Int{
        return if (flag) {
            ::sumDigits
        }
        else ::fact
    }

    fun sumDigits(n: Int): Int = if (n<10) n else (n%10)+sumDigits(n/10)

    fun transformNumber(n: Int, funct: (Int, Int)->Int, result:Int=0): Int  =
            if (n==0) result else transformNumber(n/10, funct, funct(n%10, result))

    fun transformNumberWrapper(n:Int, funct: (Int) -> Int, result: Int=0): Int = funct(n)


    fun numDivsPrimePos(list: List<Int>): List<Int>{
        return process(list, {num -> if (countDivs(num)==0 && num>=0) true else false}, ::countDivs)
    }

    // задание 2
    fun maxDigitCyclic(n:Int): Int {
        var max = 0
        var temp = n
        while (temp!=0){
            if (max < temp%10) max = temp%10
            temp /= 10
        }
        return max
    }

    fun sumDigitMod3Cyclic(n:Int):Int{
        var sum = 0
        var temp = n
        var currentDigit = 0
        while (temp!=0){
            currentDigit = temp%10
            if (currentDigit%3==0) sum += currentDigit
            temp /= 10
        }
        return sum
    }

    fun countDivsCyclic(n:Int): Int{
        var count = 2
        var div = 2
        while (div<n){
            if (n%div==0) count++
            div++
        }
        return count
    }

    // задание 3
    fun maxDigitDown(n:Int, max:Int = 0):Int = if (n==0) max else if (n%10>max) maxDigitDown(n/10, n%10) else maxDigitDown(n/10, max)

    fun maxDigitUp(n:Int):Int{
        if (n == 0) return 0
        val maxOfRest = maxDigitUp(n / 10)
        return if (n % 10 > maxOfRest) n % 10 else maxOfRest
    }

    fun sumDigitMod3Up(n:Int):Int {
        if (n==0) return 0
        if (n%10%3==0) return sumDigitMod3Up(n/10) + n%10
        else return sumDigitMod3Up(n/10)
    }

    tailrec fun sumDigitMod3Down(n:Int, sum:Int=0): Int = if (n==0) sum
    else if (n%10%3==0) sumDigitMod3Down(n/10, sum+n%10) else sumDigitMod3Down(n/10, sum)

    fun countDivsUp(n: Int, div:Int=1):Int = if (n<div) 0 else
        if (n%div==0) countDivsUp(n, div+1) +1
        else countDivsUp(n, div+1)


    fun main() {
        println("Hello World!")
        println(fact(3))
        println(factDown(3))
        val sumOrFact = createFunction(false)
        println(sumOrFact(12))
        val result = transformNumber(110, { a, b -> (a+b)}, 0)
        println(result)
        var result2 = transformNumber(1234, {a, b -> if (a<b) a else b})
        println(result2)
        // задание 4 пункт 1 - функция высшего порядка для максимальной цифры
        result2 = transformNumber(1234, {a, b -> if (a>b) a else b})
        println(result2)
        result2 = transformNumber(1234, {a, b -> if (a>b) a else b})
        println("Task 2")
        println(maxDigitCyclic(123))
        println(sumDigitMod3Cyclic(123))
        println(countDivsCyclic(60))
        println("Task 3")
        println(sumDigitMod3Down(123))
        println(countDivsUp(123))
        var result3 = transformNumber(1234, {a, b -> if (a%3==0) (a+b) else b})
        println(result3)
        result3 = transformNumberWrapper(1234, ::countDivs)
        println(result3)
    }
}

fun main() = RecursionUpAndDown().main()