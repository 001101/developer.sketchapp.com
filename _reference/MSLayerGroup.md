---
title: MSLayerGroup
summary: MSLayerGroup represents a group in the document, but is an MSLayer itself. Two important subclasses of MSLayerGroup are MSArtboardGroup and MSPage.
rels:
  - MSArtboardGroup
  - MSLayer
---

MSLayerGroup represents a group in the document, but is an [MSLayer](/reference/MSLayer/) itself. Two important subclasses of MSLayerGroup are [MSArtboardGroup](/reference/MSArtboardGroup/) and [MSPage](/reference/MSPage/).

## Methods & Attributes

### layers

Returns an array of all layers in the group - not including any of their children. In this way you can see that a document is basically a tree structure of layers & groups.

### children

Returns an array of all layers in the group, including those in any sub-groups that have click-through enabled. Basically this array contains all layers that are directly selectable from within this group.

### resizeRoot:

Available in Sketch 3.4 and below, removed in Sketch 3.5 (see `resizeToFitChildrenWithOption:`). Resizes the group to fit around all of its sub-layers.

### resizeToFitChildrenWithOption:option

Added in Sketch 3.5. Resizes the group to fit around all of its sub-layers. `option` is either 0 (MSLayerGroupResizeOptionLayerOnly) or 1 (MSLayerGroupResizeOptionResizeParentUponRectChange).

### addLayers:(NSArray)layers

Add layers to this group.

### removeLayer:

Remove a layer from this group.

### addLayerOfType:

Adds a completely new layer to the group, at the group’s {0,0} origin. This method takes one argument; a string which indicates the kind of layer. Currently the only supported values are: "rectangle" and "text".

This method returns the new layer which you can then manipulate/style using the other scripting methods.

```
var group = context.selection[0]
var new_layer = group.addLayerOfType("rectangle")
log(new_layer) // <MSShapeGroup: 0x7ff3f2c42790> Rectangle (C008AC08-FB43-42E9-9267-81E9F348AF42)
```
