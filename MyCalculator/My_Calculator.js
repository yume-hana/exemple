let r = 0;
let i = 0;
function enter() {

    if (typeof x == 'number' || x === '.') {
        if((cases.length===0 || cases.includes('.')===true) && x === '.'){ 
            if(cases.length===0){
                document.getElementById('tt').textContent = 'Enter ur operation(: ..';
            }
        else if (operator.length !== 0) {
            document.getElementById('tt').textContent = display.join('') + cases.join('');
        }
        else
            document.getElementById('tt').textContent = cases.join('');           
        }
        else{
        cases.push(x);
        if (operator.length !== 0) {
            document.getElementById('tt').textContent = display.join('') + cases.join('');
        }
        else
            document.getElementById('tt').textContent = cases.join('');
    } }
    else if (x === '+' || x === '-' || x === '*' || x === '/' || x === '%') {
        // if((cases.length===0 && numbers.length===operator.length)|| (numbers.length===1 && calculat()!==0 && cases.length===0)){
        //     if(display.length!==0){document.getElementById('tt').textContent = display.join('')}
        //  else
        //     document.getElementById('tt').textContent = cases.join('');
        // return;
        // }
        // else{
        if (cases.length === 0) {
            operator.push(x);
            display.push(numbers[numbers.length - 1].join('') + operator[operator.length - 1]);
            document.getElementById('tt').textContent = display.join('');
        }
        else if (cases.length !== 0) {
            numbers.push(cases);
            cases = [];
            operator.push(x);
            display.push(numbers[numbers.length - 1].join('') + operator[operator.length - 1]);
            document.getElementById('tt').textContent = display.join('');
        }
    }
    // }
    else if (x === '=') {
        numbers.push(cases);
        cases = [];
        document.getElementById('tt').textContent = calculat();
    }

    else if (x === 'c') {
        if (operator.length !== 0 && cases.length !== 0) {
            cases.pop();
            document.getElementById('tt').textContent = display.join('') + cases.join('');
        }
        else if (operator.length === 0 && cases.length !== 0) {
            cases.pop();
            document.getElementById('tt').textContent = cases.join('');
        }
        else if (operator.length === 0 && cases.length === 0) {
            if (numbers.length !== 0) {
                numbers[numbers.length - 1].pop();
                if (numbers[numbers.length - 1].length === 0) {
                    numbers.pop();
                }
                else { document.getElementById('tt').textContent = numbers[numbers.length - 1].join(''); }

            }
            else { document.getElementById('tt').textContent = 'Enter ur operation(: ..' }

        }
        else if (operator.length !== 0 && cases.length === 0) {
            if (operator.length === numbers.length && numbers.length !== 0) {//!
                operator.pop();
                display.pop();
                document.getElementById('tt').textContent = display.join('') + numbers[numbers.length - 1].join('');
            }
            else if (operator.length !== numbers.length && numbers.length !== 0) {//!
                if (numbers[numbers.length - 1].length === 0) {
                    numbers.pop();
                    document.getElementById('tt').textContent = display.join('');
                }
                else {
                    numbers[numbers.length - 1].pop();
                    document.getElementById('tt').textContent = display.join('') + numbers[numbers.length - 1].join('');
                }
            }


        }
        console.log('numbers:', numbers);
        console.log('operator:', operator);
        console.log('cases:', cases);
        console.log('display:', display);
    }
    // if (operator.length>numbers.length)

    else if (x === 'x') {
        cases = [];
        operator = [];
        numbers = [];
        display = [];
        document.getElementById('tt').textContent = 'Enter ur operation(: ..' ;
    }
    console.log('numbers:', numbers);
    console.log('operator:', operator);
    console.log('cases:', cases);
}


let result;
function calculat() {
    let m = 0;
    let i = 1;
    for (let n = 0; n < operator.length; n++) {
        if (operator[n] === '*' || operator[n] === '/' || operator[n] === '%') {
            switch (operator[n]) {
                case '*':
                    result = Number(numbers[n].join('')) * Number(numbers[n+1].join(''));
                    break;
                case '/':
                    if (Number(numbers[n+1].join('')) === 0) {
                        result = document.getElementById('tt').textContent = 'syntax error):';
                        return result;
                    }
                    else 
                       result = Number(numbers[n].join('')) / Number(numbers[n+1].join(''));
                    break;
                case '%':
                    result = Number(numbers[n].join('')) % Number(numbers[n+1].join(''));
                    break;

            }
            operator.splice(n, 1);

        let digits = [];
        let temp = result; // باش ما نغلطوش فـ result الأصلي
        do {
            digits.unshift(temp % 10);
            temp = Math.floor(temp / 10);
        } while (temp > 0);

        numbers.splice(n , 2 , digits);
        display.shift();
        n--;
        }
    }
    result = Number(numbers[0].join(''));
    while (numbers.length > 1) {
        switch (operator[0]) {
            case '+':
                result = result + Number(numbers[1].join(''));

                break;

            case '-':
                result = result - Number(numbers[1].join(''));
                break;
        }
        operator.shift();

        let digits = [];
        let temp = result; // باش ما نغلطوش فـ result الأصلي
        do {
            digits.unshift(temp % 10);
            temp = Math.floor(temp / 10);
        } while (temp > 0);

        numbers.splice(0, 2);       // نحذف أول رقمين
        numbers.unshift(digits);    // ونزيد النتيجة الجديدة كأول عنصر
        display.shift();
        m++;
    }
    console.log('numbers:', numbers);
    console.log('operator:', operator);

    return result;
}


let x, butt;
let numbers = [];
let operator = [];
let cases = [];
let display = [];
butt = document.getElementsByTagName('button');
let sound=document.getElementsByTagName('audio')[0];
let soundequels=document.getElementsByTagName('audio')[1];
const element= document.querySelector('#t');
for (let r = 0; r < butt.length; r++) {
    butt[r].addEventListener('click', function () {
        if(element){
           element.remove();  
        }  
        document.getElementById('tt').classList.remove('hidden');
        document.getElementById('tt').classList.add('show');
        
        if (this.id==='b17'){
soundequels.currentTime = 0;
        soundequels.play();
        }
        sound.currentTime = 0;
        sound.play();
        switch (this.id) {
            case 'b1':
                x = +0;
                break;
            case 'b2':
                x = +1;
                break;
            case 'b3':
                x = +2;
                break;
            case 'b4':
                x = +3;
                break;
            case 'b5':
                x = +4;
                break;
            case 'b6':
                x = +5;
                break;
            case 'b7':
                x = +6;
                break;
            case 'b8':
                x = +7;
                break;
            case 'b9':
                x = +8;
                break;
            case 'b10':
                x = +9;
                break;
            case 'b11':
                x = '.';
                break;
            case 'b12':
                x = '+';
                break;
            case 'b13':
                x = '-';
                break;
            case 'b14':
                x = '*';
                break;
            case 'b15':
                x = '/';
                break;
            case 'b16':
                x = '%';
                break
            case 'b17':
                x = '=';
                break;
            case 'b18':
                x = 'c';
                break;
            case 'b19':
                x = 'x';
                break;
        }
        
        enter();



    });

}

