                      INCLUDE EMU8086.INC     ;Including Library

org 100h

.data       ;Data Segment

msg_intro db '  1. Addition', 0dh,0ah, '  2. Subtration', 0dh,0ah, '  3. Multiplication', 0dh,0ah, '  4. Division', 0dh,0ah,'  5. OR', 0dh,0ah, '  6. AND ', 0dh,0ah, '  7. XOR', 0dh,0ah, '  8. NOT',0dh,0ah, '  9. Modulus',0dh,0ah, '  0. EXIT', '$'

msg_A db 'The SUM of two Numbers = $', 0dh,0ah       ;Printing Strings
msg_S db 'The SUBTRACTION of two Numbers = $', 0dh,0ah
msg_M db 'The MULTIPLICATION of two Numbers = $', 0dh,0ah
msg_D db 'The DIVISION of two Numbers = $', 0dh,0ah 
msg_OR db 'The OR operation of two Number = $', 0dh,0ah
msg_AND db 'The AND operation of two  Number = $', 0dh,0ah 
msg_XOR db 'The XOR operation of two Number = $', 0dh,0ah 
msg_NOT db 'The NOT of Number = $', 0dh,0ah
msg_MD db 'The MODULUS of Two Numbers = $', 0dh,0ah

cont db 10,13,'Do you want to operate again ? $'
bye db '            All operations performed successfully...... $'
      
val1 dw ?       ;initialization of values
val2 dw ?         
temp dw ?
agn dw ?

.code       ;Code Segment
MAIN PROC
    
MOV AX, @data
MOV DS, AX

Start:                  ;Start Lable

print '             ALU Design    '   
printn      ;New Line 
print '                       -By Aashray Arora (21104003)    ' 
printn      ;New Line                              
print '                           Anurag Singh Yadav (21104020)   '    
printn      ;New Line

printn

Start2: 
printn
printn
MOV AH,9
MOV DX, OFFSET msg_intro
INT 21h                                          

printn
printn
print 'Select Any Operation : '
CALL scan_num
printn
printn

CMP CX, 0
JE _Bye                  


CMP CX, 1
JE Addition     


CMP CX, 2
JE Subtraction     
   
   
CMP CX, 3
JE Multiplication     


CMP CX, 4
JE Division    


CMP CX, 5
JE _OR       


CMP CX, 6
JE _AND       


CMP CX, 7
JE _XOR       


CMP CX, 8
JE _NOT       


CMP CX, 9
JE Modulus    

                       ;FUNCTIONS

Addition:       ;Addition Func

print '     Addition of two number:'
printn
printn
print 'Enter First Number: '
CALL scan_num       ;First no. input
MOV val1, CX        ;Moving first no. to val1   

printn      ;New Line 

print 'Enter Second Number: '
CALL scan_num       ;Second no. input
MOV val2, CX        ;Moving second no. to val2
printn

MOV AX, val1        ;Moving val1 to AX reg
ADD AX, val2        ;Adding AX to val2
MOV temp, AX         ;Storing AX in temp

printn
MOV AH,9
MOV DX, OFFSET msg_A    ;Displaying Message
INT 21h                 ;Calling Interrupt

MOV AX, temp             ;Moving temp to AX
CALL print_num          ;Printing AX reg
                        
JMP Con                 ;Goes to Con Func               


Subtraction:        ;Subtraction Func

print '     Subtraction of two number:'
printn
printn
print 'Enter First Number: '
CALL scan_num       ;First no. input
MOV val1, CX        ;Moving first no. to val1   

printn      ;New Line 

print 'Enter Second Number: '
CALL scan_num       ;Second no. input
MOV val2, CX        ;Moving second no. to val2
printn

MOV AX, val1        ;Moving val1 to AX reg
SUB AX, val2        ;Subtracting AX with val2
MOV temp, AX         ;Storing AX in temp

printn
MOV AH,9
MOV DX, OFFSET msg_S    ;Displaying Message
INT 21h                 ;Calling Interrupt

MOV AX, temp             ;Moving temp to AX
CALL print_num          ;Printing AX reg

JMP Con                 ;Goes to Con Func             


Multiplication:        ;Multiplication Func

print '     Multiplication of two number:'
printn  
printn
print 'Enter First Number: '
CALL scan_num       ;First no. input
MOV val1, CX        ;Moving first no. to val1   

printn      ;New Line 

print 'Enter Second Number: '
CALL scan_num       ;Second no. input
MOV val2, CX        ;Moving second no. to val2
printn

MOV AX, val1        ;Moving val1 to AX reg
MUL val2            ;Multiplying AX with val2
MOV temp, AX         ;Storing AX in temp

printn
MOV AH,9
MOV DX, OFFSET msg_M    ;Displaying Message
INT 21h                 ;Calling Interrupt

MOV AX, temp             ;Moving temp to AX
CALL print_num          ;Printing AX reg

JMP Con                 ;Goes to Con Func


Division:        ;Division Func

print '     Division of two number:  '
printn
printn
print 'Enter First Number: '
CALL scan_num       ;First no. input
MOV val1, CX        ;Moving first no. to val1 
MOV AX, val1        ;Moving val1 to AX reg  

printn      ;New Line 

print 'Enter Second Number: '
CALL scan_num       ;Second no. input
MOV val2, CX        ;Moving second no. to val2    
MOV BX, val2
printn

CMP BX, 0      ;if divisor = 2 
JE Error        ;overflow

MOV DX, 0           ;Moving 0 in DX to avoid overflow

DIV BX            ;Dividing AX with val2
MOV temp, AX         ;Storing AX in temp

printn
MOV AH,9
MOV DX, OFFSET msg_D    ;Displaying Message
INT 21h                 ;Calling Interrupt

MOV AX, temp             ;Moving temp to AX
CALL print_num          ;Printing AX reg

JMP Con                 ;Goes to Con Func




        
        
Modulus:

print '     Modulus of two numbers'
printn
printn
print 'Enter First Number: '
CALL scan_num       ;First no. input
MOV val1, CX        ;Moving first no. to val1 
MOV AX, val1        ;Moving val1 to AX reg  

printn      ;New Line 

print 'Enter Second Number: '
CALL scan_num       ;Second no. input
MOV val2, CX        ;Moving second no. to val2    
MOV BX, val2
printn

MOV DX, 0           ;Moving 0 in DX to avoid overflow

DIV BX            ;Dividing AX with val2
MOV temp, DX         ;Storing AX in temp

printn
MOV AH,9
MOV DX, OFFSET msg_MD    ;Displaying Message
INT 21h                 ;Calling Interrupt

MOV AX, temp             ;Moving temp to AX
CALL print_num          ;Printing AX reg

JMP Con                 ;Goes to Con Func



_OR:            ;OR Func

print '     Binary OR of two number:  '
printn
printn
print 'Enter First Number: '
CALL scan_num       ;First no. input
MOV val1, CX        ;Moving first no. to val1   

printn      ;New Line 

print 'Enter Second Number: '
CALL scan_num       ;Second no. input
MOV val2, CX        ;Moving second no. to val2
printn

MOV AX, val1
OR AX, val2
MOV temp, AX

printn
MOV AH,9
MOV DX, OFFSET msg_OR    ;Displaying Message
INT 21h                 ;Calling Interrupt

MOV AX, temp
CALL print_num          ;Prints on screen

JMP Con


_AND:               ;AND Func

print '     Binary AND of two number:  '
printn
printn
print 'Enter First Number: '
CALL scan_num       ;First no. input
MOV val1, CX        ;Moving first no. to val1   

printn      ;New Line 

print 'Enter Second Number: '
CALL scan_num       ;Second no. input
MOV val2, CX        ;Moving second no. to val2
printn

MOV AX, val1
AND AX, val2
MOV temp, AX

printn
MOV AH,9
MOV DX, OFFSET msg_AND    ;Displaying Message
INT 21h                 ;Calling Interrupt

MOV AX, temp
CALL print_num          ;Prints on screen

JMP Con
 
 
_XOR:               ;XOR Func

print '     Binary XOR of two number:  '
printn
printn
print 'Enter First Number: '
CALL scan_num       ;First no. input
MOV val1, CX        ;Moving first no. to val1   

printn      ;New Line 

print 'Enter Second Number: '
CALL scan_num       ;Second no. input
MOV val2, CX        ;Moving second no. to val2
printn

MOV AX, val1
XOR AX, val2
MOV temp, AX

printn
MOV AH,9
MOV DX, OFFSET msg_XOR    ;Displaying Message
INT 21h                 ;Calling Interrupt

MOV AX, temp
CALL print_num          ;Prints on screen

JMP Con
 

_NOT:             ;NOT Func               

print '     Binary NOT of a number:  '
printn  
printn
print 'Enter Number: '
CALL scan_num       ;First no. input
MOV val1, CX        ;Moving first no. to val1   

printn      ;New Line 

MOV AX, val1
NOT AX
MOV temp, AX

printn
MOV AH,9
MOV DX, OFFSET msg_NOT    ;Displaying Message
INT 21h                 ;Calling Interrupt

MOV AX, temp
CALL print_num

JMP Con


Error:    

printn
print 'ERROR: Cannot be divided by 0. ' 
printn
print ' Math Error'
printn    
printn

JMP Division


Con:            ;Continue Func
 
printn
MOV AH,9
MOV DX, OFFSET cont    ;Displaying Message
INT 21h                 ;Calling Interrupt
print '(Y = 1 / N = 0) : '
CALL scan_num           
MOV agn, CX
printn
printn

CMP agn, 1
JE Start2                               

CMP agn, 0
JE _Bye            
printn


_Bye:       ;EXIT Func

printn
printn
MOV AH,9
MOV DX, OFFSET bye    ;Displaying Message
INT 21h                        


MAIN ENDP        


DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS


END main

HLT         ;Halting                                            
ret         ;Return