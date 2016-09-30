package sist.co.help;

public class arrowHelp {

	private int depth=0;
	private int parent=0;
	
	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getParent() {
		return parent;
	}

	public void setParent(int parent) {
		this.parent = parent;
	}

	public String getArrow(){
		String rs = "<img src = 'image/arrow.png' width='20px' height='20px' />";
		
		String nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;";
		String ts = "";
		
		for(int i = 0; i<depth; i++){
			ts += nbsp;
		}
		
		return depth == 0? "" : ts+rs;
	}
	
	public String getMy(){
		String par = "";
		if(parent == 0){
			par = "[부모글이 삭제 되었습니다.]";
		}
		
		return par;
	}
	
}
