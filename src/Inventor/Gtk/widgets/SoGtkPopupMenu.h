/**************************************************************************
 *
 *  This file is part of the Coin SoGtk GUI binding library.
 *  Copyright (C) 2000 by Systems in Motion.  All rights reserved.
 *
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Lesser General Public License
 *  version 2.1 as published by the Free Software Foundation.  See the
 *  file LICENSE.LGPL at the root directory of the distribution for
 *  more details.
 *
 *  If you want to use Coin SoGtk for applications not compatible with the
 *  LGPL, please contact SIM to acquire a Professional Edition License.
 *
 *  Systems in Motion, Prof Brochs gate 6, N-7030 Trondheim, NORWAY
 *  http://www.sim.no/ support@sim.no Voice: +47 22114160 Fax: +47 22207097
 *
 **************************************************************************/

//  $Id$

#ifndef SOGTK_POPUPMENU_H
#define SOGTK_POPUPMENU_H

#include <Inventor/Gtk/SoGtkBasic.h>
#include <Inventor/Gtk/widgets/SoAnyPopupMenu.h>

struct MenuRecord;
struct ItemRecord;

// *************************************************************************

class SOGTK_DLL_EXPORT SoGtkPopupMenu : public SoAnyPopupMenu {
public:
  SoGtkPopupMenu(void);
  ~SoGtkPopupMenu(void);

  virtual int newMenu( char * name, int menuid = -1 );
  virtual int getMenu( char * name );
  virtual void setMenuTitle( int id, char * title );
  virtual char * getMenuTitle( int id );

  virtual int newMenuItem( char * name, int itemid = -1 );
  virtual int getMenuItem( char * name );
  virtual void setMenuItemTitle( int itemid, char * title );
  virtual char * getMenuItemTitle( int itemid );
  virtual void setMenuItemEnabled( int itemid, SbBool enabled );
  virtual SbBool getMenuItemEnabled( int itemid );

  virtual void _setMenuItemMarked( int itemid, SbBool marked );
  virtual SbBool getMenuItemMarked( int itemid );

  virtual void addMenu( int menuid, int submenuid, int pos = -1 );
  virtual void addMenuItem( int menuid, int itemid, int pos = -1 );
  virtual void addSeparator( int menuid, int pos = -1 );
  virtual void removeMenu( int menuid );
  virtual void removeMenuItem( int itemid );

  virtual void popUp( GtkWidget * inside, int x, int y );

protected:
  MenuRecord * getMenuRecord( int menuid );
  ItemRecord * getItemRecord( int itemid );
  MenuRecord * createMenuRecord( char * name );
  ItemRecord * createItemRecord( char * name );

  void traverseBuild( GtkWidget * parent, MenuRecord * menu, int indent );
  GtkWidget * build( GtkWidget * parent );

  void selection( int itemid );
  static void selectionCB( GtkWidget *, gpointer );

private:
  void createSeparator( ItemRecord * item );
  void createMenuItem( ItemRecord * item );

  SbPList * menus;
  SbPList * items;
  GtkWidget * popup;
  SbBool dirty;

}; // class SoGtkPopupMenu

// *************************************************************************

#endif // ! SOGTK_POPUPMENU_H
