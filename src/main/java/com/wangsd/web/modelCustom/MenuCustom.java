package com.wangsd.web.modelCustom;


import com.wangsd.web.model.Menu;

import java.util.List;

/**
 * Created by Administrator on 2017/6/9.
 */
public class MenuCustom extends Menu {

    private List<Menu> sonMenu;
    
    private boolean checked;
    
    private boolean open;

    public List<Menu> getSonMenu() {
        return sonMenu;
    }

    public void setSonMenu(List<Menu> sonMenu) {
        this.sonMenu = sonMenu;
    }

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	public boolean isOpen() {
		return open;
	}

	public void setOpen(boolean open) {
		this.open = open;
	}
}
