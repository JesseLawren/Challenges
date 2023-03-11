public class Calculator {
    public Integer Add(Integer a, Integer b){
        sum = a + b;
        return sum;
    }

    public Integer Multiply(Integer a, Integer b){
        Integer product = 0;
        
        if (a == 0 || b == 0) {
            return 0;
        } else if (b > 0) {
            for (Integer i = 1; i <= b; i++) {
                product = Add(product, a);
            }
        } else {
            for (Integer i = -1; i >= b; i--) {
                product = Add(product, -a);
            }
        }

        return product;
    }

    public Integer Divide(Integer dividend, Integer divisor){
        
        if (divisor == 0){
            return System.debug('0');
        }
        Integer quotient = 0;
        Integer absDividend = Math.abs(dividend);
        Integer absDivisor = Math.abs(divisor);
        while (absDividend >= absDivisor){
            absDividend = Add(absDividend, -absDivisor);
            quotient = Add(quotient, 1);
        }
        // Determine the sign of the quotient based on the sign of the inputs
        if ((dividend < 0 && divisor > 0) || (dividend > 0 && divisor < 0)){
            quotient = Add(quotient, -1);
        }

        return quotient;
    }

    public Integer Mod(Integer dividend, Integer divisor){
        
        if (divisor == 0){
            return System.debug('0');
        }
        Integer quotient = Divide(dividend, divisor);
        Integer product = Multiply(divisor, quotient);
        Integer remainder = Add(dividend, -product);
        
        return remainder;
    }
    
}

