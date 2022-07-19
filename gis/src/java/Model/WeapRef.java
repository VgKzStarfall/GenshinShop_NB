/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author HP
 */
public class WeapRef {
    public String WeapName;
    public int refine;
    
    public WeapRef(){
        
    }

    public WeapRef(String WeapName, int refine) {
        this.WeapName = WeapName;
        this.refine = refine;
    }

    public String getWeapName() {
        return WeapName;
    }

    public void setWeapName(String WeapName) {
        this.WeapName = WeapName;
    }

    public int getRefine() {
        return refine;
    }

    public void setRefine(int refine) {
        this.refine = refine;
    }
    
}
