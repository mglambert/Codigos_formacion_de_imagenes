% P_control(op, r, sa, sb)
%
% Funcion para obtener la palabra de control de micro-operaciones a la 
% salida del decodificador de instrucciones del computador simple estudiado 
% en el curso IEE2713
%
% op  Palabra nemotecnica de la operacion
% r   Destination regiter
% sa  Source register A
% sb  Source register B
% 
% Ejemplos:
%           R[5] <-- R[1] + 6
%           P_control('ADI', 5, 1, 6)
%
%           M[R[1]] <-- R[3]
%           P_control('ST', 'xxx', 1, 3) o P_control('ST', 0, 1, 3)
%
% Mathias Lambert (c), 2018

function P_control(op, r, sa, sb)
    opcode = NaN;
    DR = r;
    SA = sa;
    SB = sb;
    
    if r ~= 'xxx'
        DR = dec2bin(r, 3);
    end
    if sa ~= 'xxx'
        SA = dec2bin(sa, 3);
    end
    if sb ~= 'xxx'
        SB = dec2bin(sb, 3);
    end
        
    switch op
        case 'MOVA'
            opcode = dec2bin(0, 7);
        case 'INC'
            opcode = dec2bin(1, 7);
        case 'ADD'
            opcode = dec2bin(2, 7);
        case 'SUB'
            opcode = dec2bin(5, 7);
        case 'DEC'
            opcode = dec2bin(6, 7);
        case 'AND'
            opcode = dec2bin(8, 7);
        case 'OR'
            opcode = dec2bin(9, 7);
        case 'XOR'
            opcode = dec2bin(10, 7);
        case 'NOT'
            opcode = dec2bin(11, 7);
        case 'MOVB'
            opcode = dec2bin(12, 7);
        case 'SHR'
            opcode = dec2bin(13, 7);
        case 'SHL'
            opcode = dec2bin(14, 7);
        case 'LDI'
            opcode = dec2bin(76, 7);
        case 'ADI'
            opcode = dec2bin(66, 7);
        case 'LD'
            opcode = dec2bin(16, 7);
        case 'ST'
            opcode = dec2bin(32, 7);
        case 'BRZ'
            opcode = dec2bin(96, 7);
        case 'BRN'
            opcode = dec2bin(97, 7);
        case 'JMP'
            opcode = dec2bin(112, 7);
    end
    if opcode(2) == opcode(1) && opcode(1) == '1'
        pl = '1';
    else 
        pl = '0';
    end
    if opcode(2) == '1' && opcode(1) == '0'
        mw = '1';
    else 
        mw = '0';
    end
    if opcode(end) == '1' && pl == '0'
        fs = '1';
    else
        fs = '0';
    end
    if opcode(2) == '1'
        rw = '0';
    else
        rw = '1';
    end
    labels = 'DA    AA    BA   MB    FS   MD  RW  MW  PL  JB  BC';
    fprintf('\n');
    disp('------------------------------------------------------');
    disp(labels);
    pc = [DR ' | ' SA ' | ' SB ' | ' opcode(1) ' | ' opcode(4:6) fs ' | ' opcode(3) ' | ' rw ' | ' mw ' | ' pl ' | ' opcode(3) ' | ' opcode(end)];
    disp(pc);
    disp('------------------------------------------------------');
    fprintf('\n');
end

