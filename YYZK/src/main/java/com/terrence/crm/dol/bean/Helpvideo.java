package com.terrence.crm.dol.bean;
import javax.persistence.Entity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.terrence.crm.dol.base.BaseEntity;
import com.terrence.crm.dol.utils.DateConvertUtils;

@Entity
public class Helpvideo extends BaseEntity implements java.io.Serializable {
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	private String videoName;
	/**
	 * 链接地址
	 */
	private String videoUrl;
	/**
	 * 详细说明
	 */
	private String videoDetail;
	/**
	 * 备注
	 */
	private String fmark;
	/**
	 * 序号
	 */
	private Integer fseq;

	public Long getId(){
		return this.id;
	}
	public void setId(Long id){
		this.id=id;
	}
	public String getVideoName(){
		return this.videoName;
	}
	public void setVideoName(String videoName){
		this.videoName=videoName;
	}
	public String getVideoUrl(){
		return this.videoUrl;
	}
	public void setVideoUrl(String videoUrl){
		this.videoUrl=videoUrl;
	}
	public String getVideoDetail(){
		return this.videoDetail;
	}
	public void setVideoDetail(String videoDetail){
		this.videoDetail=videoDetail;
	}
	public String getFmark(){
		return this.fmark;
	}
	public void setFmark(String fmark){
		this.fmark=fmark;
	}
	public Integer getFseq(){
		return this.fseq;
	}
	public void setFseq(Integer fseq){
		this.fseq=fseq;
	}
	public String toString() {
		return new ToStringBuilder(this)
			.append("Id",getId())
			.append("VideoName",getVideoName())
			.append("VideoUrl",getVideoUrl())
			.append("VideoDetail",getVideoDetail())
			.append("Fmark",getFmark())
			.append("Fseq",getFseq())
			.toString();
		}
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.append(getVideoName())
			.append(getVideoUrl())
			.append(getVideoDetail())
			.append(getFmark())
			.append(getFseq())
			.toHashCode();
		}
	public boolean equals(Object obj) {
		if(obj instanceof Helpvideo == false) return false;
		if(this == obj) return true;
		Helpvideo other = (Helpvideo)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.append(getVideoName(),other.getVideoName())
			.append(getVideoUrl(),other.getVideoUrl())
			.append(getVideoDetail(),other.getVideoDetail())
			.append(getFmark(),other.getFmark())
			.append(getFseq(),other.getFseq())
			.isEquals();
		}

}
