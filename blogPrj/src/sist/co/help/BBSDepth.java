package sist.co.help;

public class BBSDepth {
	
	private int depth=0;

	public void setDepth(int depth) {
		this.depth = depth;
	}
	
	
	public String getHand(){
		String hd="<i class='fa fa-hand-o-right' aria-hidden='true' style='padding-left:30px;'></i>";
		
		return depth==0?"":hd;
	}

}
