/**************************************************************************\
 *
 *  Copyright (C) 1998-1999 by Systems in Motion.  All rights reserved.
 *
 *  This file is part of the Coin library.
 *
 *  This file may be distributed under the terms of the Q Public License
 *  as defined by Troll Tech AS of Norway and appearing in the file
 *  LICENSE.QPL included in the packaging of this file.
 *
 *  If you want to use Coin in applications not covered by licenses
 *  compatible with the QPL, you can contact SIM to aquire a
 *  Professional Edition license for Coin.
 *
 *  Systems in Motion AS, Prof. Brochs gate 6, N-7030 Trondheim, NORWAY
 *  http://www.sim.no/ sales@sim.no Voice: +47 22114160 Fax: +47 67172912
 *
\**************************************************************************/

static const char rcsid[] =
  "$Id$";

/*!
  \class SoGtkMouse SoGtkMouse.h Inventor/Gtk/devices/SoGtkMouse.h
  \brief The SoGtkMouse class ...
  \ingroup gtkdevices

  FIXME: write class doc
*/

#include <assert.h>

#include <Inventor/events/SoMouseButtonEvent.h>
#include <Inventor/events/SoLocation2Event.h>

#include <sogtkdefs.h>
#include <Inventor/Gtk/devices/SoGtkMouse.h>


/*!
  \enum SoGtkMouse::SoGtkMouseEventMask
  FIXME: write documentation for enum
*/
/*!
  \var SoGtkMouse::SoGtkMouseEventMask SoGtkMouse::ButtonPressMask
  FIXME: write documentation for enum definition
*/
/*!
  \var SoGtkMouse::SoGtkMouseEventMask SoGtkMouse::ButtonReleaseMask
  FIXME: write documentation for enum definition
*/
/*!
  \var SoGtkMouse::SoGtkMouseEventMask SoGtkMouse::PointerMotionMask
  FIXME: write documentation for enum definition
*/
/*!
  \var SoGtkMouse::SoGtkMouseEventMask SoGtkMouse::ButtonMotionMask
  FIXME: write documentation for enum definition
*/
/*!
  \var SoGtkMouse::SoGtkMouseEventMask SoGtkMouse::SO_GTK_ALL_MOUSE_EVENTS
  FIXME: write documentation for enum definition
*/


/*!
  Constructor.
*/
SoGtkMouse::SoGtkMouse(
  SoGtkMouseEventMask mask)
{
  this->eventmask = mask;
  this->buttonevent = NULL;
  this->locationevent = NULL;
}

/*!
  Destructor.
*/
SoGtkMouse::~SoGtkMouse(void)
{
  delete this->buttonevent;
  delete this->locationevent;
}

/*!
  FIXME: write function documentation
*/
void
SoGtkMouse::enable(GtkWidget * /*w*/, SoGtkEventHandler /*f*/, void * /*data*/)
{
  // TODO: implement
}

/*!
  FIXME: write function documentation
*/
void
SoGtkMouse::disable(GtkWidget * /*w*/, SoGtkEventHandler /*f*/, void * /*data*/)
{
  // TODO: implement
}

/*!
  FIXME: write function documentation
*/
const SoEvent *
SoGtkMouse::translateEvent(GdkEvent * event)
{
/*
  SoEvent * super = NULL;
  QMouseEvent * mouseevent = (QMouseEvent *)event;


  // Check for mousebutton press/release. Note that mousebutton
  // doubleclick events are ignored, as double clicks also generate 2
  // pairs of press and release events. In other words: it's the
  // user's responsibility to translate pairs of singleclicks to
  // doubleclicks, if doubleclicks have a special meaning.

  // FIXME: check if the above statement is actually correct, as Qt
  // sends this series of events upon dblclick:
  // press,release,dblclick,release. Reported to Troll Tech as a
  // possible bug. 19991001 mortene.
  if (((event->type() == Event_MouseButtonPress) ||
       (event->type() == Event_MouseButtonRelease)) &&
      (this->eventmask & (SoGtkMouse::ButtonPressMask |
                          SoGtkMouse::ButtonReleaseMask))) {

    // Allocate system-neutral event object once and reuse.
    if (!this->buttonevent) this->buttonevent = new SoMouseButtonEvent;

    // Which button?
    switch (mouseevent->button()) {
    case LeftButton:
      this->buttonevent->setButton(SoMouseButtonEvent::BUTTON1);
      break;
    case MidButton:
      this->buttonevent->setButton(SoMouseButtonEvent::BUTTON2);
      break;
    case RightButton:
      this->buttonevent->setButton(SoMouseButtonEvent::BUTTON3);
      break;
    default:
      assert(0);
      break;
    }

    // Press or release?
    if (mouseevent->button() & mouseevent->state())
      this->buttonevent->setState(SoButtonEvent::UP);
    else
      this->buttonevent->setState(SoButtonEvent::DOWN);

    super = this->buttonevent;
  }


  // Check for mouse movement.
  if ((event->type() == Event_MouseMove) &&
      (this->eventmask & (SoGtkMouse::PointerMotionMask |
                          SoGtkMouse::ButtonMotionMask))) {
    // Allocate system-neutral event object once and reuse.
    if (!this->locationevent) this->locationevent = new SoLocation2Event;

    super = this->locationevent;
  }


  // Common settings for SoEvent superclass.
  if (super) {
    // Modifiers
    super->setShiftDown(mouseevent->state() & ShiftButton);
    super->setCtrlDown(mouseevent->state() & ControlButton);
    super->setAltDown(mouseevent->state() & AltButton);

    this->setEventPosition(super, mouseevent->x(), mouseevent->y());
    // FIXME: should be time of Qt event. 990211 mortene.
    super->setTime(SbTime::getTimeOfDay());
  }

  return super;
*/
  return NULL;
}
