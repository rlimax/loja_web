package DAO;

import java.util.Calendar;

public class DataHora {

    Calendar data = Calendar.getInstance();
    public String getData(){
        String hoje;
        hoje = Integer.toString(data.get(Calendar.YEAR));
        
        if(data.get(Calendar.MONTH)<10){
            hoje = hoje + "-0"+Integer.toString(data.get(Calendar.MONTH));
        }else{
            hoje = hoje +"-"+ Integer.toString(data.get(Calendar.MONTH));        
        }
        
        
        if(data.get(Calendar.DAY_OF_MONTH)<10){
            hoje = hoje+"-0"+Integer.toString(data.get(Calendar.DAY_OF_MONTH));
        }else{
            hoje = hoje+"-"+Integer.toString(data.get(Calendar.DAY_OF_MONTH));        
        }

        return hoje;
        
    }
    
    public String formataData(String data){
        String retorno;
        retorno = data.substring(8, 10)+"/"+data.substring(5, 7)+"/"+data.substring(0, 4);
        return retorno;
    }
}
