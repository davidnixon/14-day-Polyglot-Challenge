use std::io;
use regex::Regex;

fn main() {
    let regex = Regex::new(r"^[a-zA-Z0-9 {}();:,.'?\-!)]+$").unwrap();
    let mut buffer = String::new();
    io::stdin().read_line(&mut buffer).expect("TODO: panic message");
    let _n: i32 = buffer.trim().parse().expect("Input not an integer");
    let mut code_line = String::new();
    io::stdin().read_line(&mut code_line).expect("TODO: panic message");
    let s_codes = code_line.split_whitespace();
    let mut codes :Vec<u32> = Vec::new();
    for s_code in s_codes {
        let code: u8 = s_code.trim().parse().expect("Input not an byte");
        codes.push(code as u32);
    }

    let mut found:bool = false;
    for i in 97..123u32 {
        for j in 97..123u32 {
            for k in 97..123u32 {
                let decode: [u32; 3] = [i,j,k];
                let mut d: usize = 0;
                let mut decoded = String::from("");
                for c in &codes {
                    let x = c ^ decode[d];
                    let dc = char::from_u32(x as u32).unwrap();
                    decoded.push(dc);
                    d = (d + 1) % 3;
                }
                if regex.is_match(&decoded) {
                    println!("{}{}{}", i as u8 as char, j as u8 as char, k as u8 as char);
                    found = true;
                    break;                    
                }
            }
            if found { break; }
        }
        if found { break; }
    }
}

