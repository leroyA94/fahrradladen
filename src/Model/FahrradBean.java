package Model;

public class FahrradBean {
    private String marke;
    private int id, groesse;
    private double preis;

    private String bild;
    private int aufLager;

	public String getMarke() {
		return marke;
	}

	public void setMarke(String marke) {
		this.marke = marke;
	}

	public int getGroesse() {
		return groesse;
	}

	public void setGroesse(int groesse) {
		this.groesse = groesse;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getPreis() {
		return preis;
	}

	public void setPreis(double preis) {
		this.preis = preis;
	}

	public int getAufLager() {
		return aufLager;
	}

	public void setAufLager(int aufLager) {
		this.aufLager = aufLager;
	}

	public String getBild() {
		return bild;
	}

	public void setBild(String bild) {
		this.bild = bild;
	}
}
