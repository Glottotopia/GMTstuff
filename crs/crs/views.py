from pyramid.view import view_config  
from pyramid.response import Response
import pyramid.httpexceptions as exc
import os
  
@view_config(route_name='coastriverborder', renderer='templates/img.pt')
def coastriverborder(request): 
  north = request.GET['north']
  south =  request.GET['south']
  west =  request.GET['west']
  east =  request.GET['east']
  filename = "%s-%s-%s-%s" % (west,east,south,north)
  cmd = "./coastriverborder.sh %s %s %s %s %s;mv %s* crs/static/ " % (filename, west,east,south,north,filename)
  print(cmd)
  os.system(cmd)
  return {'project': 'gmt',
  'img': filename}