package Model;

public class CharCons {
    public String charname;
    public int cons;
    
    public CharCons() {
        
    }

    public CharCons(String charname, int cons) {
        this.charname = charname;
        this.cons = cons;
    }

    public String getCharname() {
        return charname;
    }

    public void setCharname(String charname) {
        this.charname = charname;
    }

    public int getCons() {
        return cons;
    }

    public void setCons(int cons) {
        this.cons = cons;
    }
}
