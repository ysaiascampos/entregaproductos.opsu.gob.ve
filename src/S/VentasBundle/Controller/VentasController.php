<?php

namespace S\VentasBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use S\VentasBundle\Entity\Ventas;
use S\VentasBundle\Form\VentasType;
use S\VentasBundle\Form\VentasAType;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Doctrine\ORM\EntityRepository;

use Symfony\Component\HttpFoundation\ResponseHeaderBag;

/**
 * Ventas controller.
 *
 * @Route("/ventas")
 */
class VentasController extends Controller
{

    /**
     * Lists all Ventas entities.
     *
     * @Route("/", name="ventas")
     * @Method("GET")
     * @Template()
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $entities = $em->getRepository('SVentasBundle:Ventas')->findAll();

        //Paginador del menu. 
        $paginator  = $this->get('knp_paginator');
        $pagination = $paginator->paginate(
        $entities,
        $this->get('request')->query->get('page', 1)/*page number*/,
         10/*limit per page*/);
        // parameters to template
        return $this->render('SVentasBundle:Ventas:index.html.twig', array('pagination' => $pagination));
    }
    /**
     * Creates a new Ventas entity.
     *
     * @Route("/", name="ventas_create")
     * @Method("POST")
     * @Template("SVentasBundle:Ventas:new.html.twig")
     */
    public function createAction(Request $request)
    {
        $entity = new Ventas();
        $form = $this->createCreateForm($entity);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            /*$entity2 = $em->getRepository('SVentasBundle:Personal')->findByNombre($entity->getNombre());
            $entity->setRolesUsuario($this->getUser()->getUsername());
            if ($entity2) {
                $entity = $entity2[0];
                $entity->setEstatus('1');
                $em->persist($entity); 
            }  else {
                $em->persist($entity); 
            } */
            $entity->setEstatus('0');
            $em->persist($entity);
            $em->flush();
            $bitacora = $em->getRepository('SVentasBundle:Bitacora')->editar('Ventas',$entity->getId(),$entity,$this->getUser()->getId(),$_SERVER['REMOTE_ADDR']);
            $em->persist($bitacora); 
            $em->flush();

            return $this->redirect($this->generateUrl('ventas_show', array('id' => $entity->getId())));
        }

        return array(
            'entity' => $entity,
            'form'   => $form->createView(),
        );
    }

    /**
     * Creates a form to create a Ventas entity.
     *
     * @param Ventas $entity The entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createCreateForm(Ventas $entity)
    {
        $form = $this->createForm(new VentasType(), $entity, array(
            'action' => $this->generateUrl('ventas_create'),
            'method' => 'POST',
        ));

        $form->add('submit', 'submit', array('label' => 'Crear','attr' => array('class' => 'btn btn-default')));

        return $form;
    }

    /**
     * Displays a form to create a new Ventas entity.
     *
     * @Route("/new", name="ventas_new")
     * @Method("GET")
     * @Template()
     */
    public function newAction()
    {
        $entity = new Ventas();
        $form   = $this->createCreateForm($entity);
        if('ROLE_SUPER_ADMIN'==$this->getUser()->getRoles()[0]){
            $form->add('idEventos', 'entity', array(
                'label' => 'Evento ','empty_value' => 'Seleccione',  "required"=> true,
                'class' => 'S\VentasBundle\Entity\Eventos',
                'query_builder' => function(EntityRepository $er ){
                    return $er->createQueryBuilder('w')
                  ->orderBy('w.id', 'ASC');
              }));
        }else{
            $form->add('idEventos', 'entity', array(
                'label' => 'Evento ','empty_value' => 'Seleccione',  "required"=> true,
                'class' => 'S\VentasBundle\Entity\Eventos',
                'query_builder' => function(EntityRepository $er ){
                    return $er->createQueryBuilder('w')
                  ->orderBy('w.id', 'ASC')
                  ->where("w.rolesUsuario='".$this->getUser()->getRoles()[0]."'");
              }));
        }

        return array(
            'entity' => $entity,
            'form'   => $form->createView(),
        );
    }

    /**
     * Finds and displays a Ventas entity.
     *
     * @Route("/{id}", name="ventas_show")
     * @Method("GET")
     * @Template()
     */
    public function showAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('SVentasBundle:Ventas')->findOneByIdJoinedToShow($id);

        $entity['eventoproductos'] = $em->getRepository('SVentasBundle:EventoProductos')->findOneByIdJoinedToProductosEvento($entity[0]->getIdEventos()->getId());
      //print_r(dump($entity));
   //die();

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Ventas entity.');
        }

        $deleteForm = $this->createDeleteForm($id);

        return array(
            'entity'      => $entity,
            'delete_form' => $deleteForm->createView(),
        );
    }

    /**
     * Displays a form to edit an existing Ventas entity.
     *
     * @Route("/{id}/edit", name="ventas_edit")
     * @Method("GET")
     * @Template()
     */
    public function editAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('SVentasBundle:Ventas')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Ventas entity.');
        }

        $editForm = $this->createEditForm($entity);
        $deleteForm = $this->createDeleteForm($id);

        return array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        );
    }

    /**
    * Creates a form to edit a Ventas entity.
    *
    * @param Ventas $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createEditForm(Ventas $entity)
    {
        $form = $this->createForm(new VentasType(), $entity, array(
            'action' => $this->generateUrl('ventas_update', array('id' => $entity->getId())),
            'method' => 'PUT',
        ));

        $form->add('submit', 'submit', array('label' => 'Editar','attr' => array('class' => 'btn btn-default')));

        return $form;
    }
    /**
     * Edits an existing Ventas entity.
     *
     * @Route("/{id}", name="ventas_update")
     * @Method("PUT")
     * @Template("SVentasBundle:Ventas:edit.html.twig")
     */
    public function updateAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('SVentasBundle:Ventas')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Ventas entity.');
        }

        $deleteForm = $this->createDeleteForm($id);
        $editForm = $this->createEditForm($entity);
        $editForm->handleRequest($request);

        if ($editForm->isValid()) {
            $em->flush();

            return $this->redirect($this->generateUrl('ventas_edit', array('id' => $id)));
        }

        return array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        );
    }
    /**
     * Deletes a Ventas entity.
     *
     * @Route("/{id}", name="ventas_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, $id)
    {
        $form = $this->createDeleteForm($id);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $entity = $em->getRepository('SVentasBundle:Ventas')->find($id);

            if (!$entity) {
                throw $this->createNotFoundException('Unable to find Ventas entity.');
            }

            $em->remove($entity);
            $em->flush();
        }

        return $this->redirect($this->generateUrl('ventas'));
    }

    /**
     * Creates a form to delete a Ventas entity by id.
     *
     * @param mixed $id The entity id
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm($id)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('ventas_delete', array('id' => $id)))
            ->setMethod('DELETE')
            ->add('submit', 'submit', array('label' => 'Eliminar','attr' => array('class' => 'btn btn-default')))
            ->getForm()
        ;
    }

    /**
     * Lists all DatosAsignacion entities.
     *
     * @Route("/buscar/", name="buscar")
     * @Template("SVentasBundle:Ventas:buscar.html.twig")
     */
    public function buscarAction()
    {
        $em = $this->getDoctrine()->getManager();
        //$user=$this->getUser()->getRoles()[0];
        $user=$this->getUser()->getId();
        $entity=$em->createQuery('SELECT a.id as id, a.nombre as nombre
        FROM S\VentasBundle\Entity\Eventos a , S\VentasBundle\Entity\UserEvento b where a.estatus=1 and b.idEvento=a.id and b.idUser='.$user)->getResult();
        $eventos=array();
        foreach ($entity as $key => $value) {
            $eventos[$value['id']]=$value['nombre'];
        }
        
        $form = $this->createFormBuilder()
            ->add('id', 'hidden')
            ->add('cedula', 'text', array('label' => 'Cédula',
                'pattern'=>'\d+'))
            ->add('tipo', 'choice' , array (
            'choices' => array ('1' => 'Carnet', '0' => 'Cédula')
            ,'expanded'=>'1',  "required"=> true,
                'data' => '1',))
            ->add('evento', 'choice' , array ('choices' => $eventos,
                "required"=> true,))          
            ->setAction($this->generateUrl('ventas_show_status'))
            ->add('buscar', 'submit', array('label' => 'buscar'))
            ->getForm();

        //return $this->redirect($this->generateUrl('inscribir', array('form' => $form->createView())));
        return array(
            'form' => $form->createView(),
        );
    }
    
    /**
    * Creates a form to edit a VentasA entity.
    *
    * @param VentasA $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createVentasAForm(Ventas $entity)
    {
        $form = $this->createForm(new VentasAType(), $entity, array(
            'action' => $this->generateUrl('ventas_update_estatus', array('id' => $entity->getId())),
            'method' => 'POST',
        ));
        $form->add('Guardar', 'submit', array('label' => 'Guardar','attr' => array('class' => 'btn btn-success')));
        return $form;
    }

  /**
     * Finds and displays a Ventas entity.
     *
     * @Route("/show/", name="ventas_show_status")
     * @Method("POST")
     * @Template("SVentasBundle:Ventas:showstatus.html.twig")
     */
    public function showEstatusAction(Request $request)
    {   
        
        if (!isset($request->request->get('form')['evento'])) {
            //nicio// controlador
        $request->getSession()->getFlashBag()->add(
        'danger',
          'Debe leccionar un Evento');
        return $this->redirect($this->generateUrl('buscar'));
        }
        $tipo = $request->request->get('form')['tipo'];
        $evento = $request->request->get('form')['evento'];
        if($tipo=="0"){
            $identificacion = $request->request->get('form')['cedula'];
        }  else {
            //decodificar carnet
            $cad_barra = $request->request->get('form')['cedula'];
            //$cad_barra = $_POST["cedula"];//Numero que te devuelve el codigo de barra


            $cad_arreglo = array();
            $orden_cadena = "45763021";
            for($i=0;$i<strlen($cad_barra);$i++){
                    $cad_arreglo[substr($orden_cadena,$i,1)] = substr($cad_barra,$i,1);
            }//end if

            $cad_restituida="";

            for($i=0;$i<strlen($orden_cadena);$i++){
                if(isset($cad_arreglo[$i])){
                    $cad_restituida .= $cad_arreglo[$i];
                }
            }//end if

            if(substr($cad_restituida, 0, 1)=="0"){
                    $cad_restituida = substr($cad_restituida, 1, strlen($cad_restituida));
            }

            $identificacion = $cad_restituida;
        }
        
    
        $em = $this->getDoctrine()->getManager();
        $entity = $em->getRepository('SVentasBundle:Ventas')->findOneByIdJoinedToVentas($identificacion,$evento);
        if (!$entity) {
            //nicio// controlador
        $request->getSession()->getFlashBag()->add(
        'danger',
          'El empleado no esta registrado en este Evento');
        return $this->redirect($this->generateUrl('buscar'));
        }
//        print_r(dump($entity));
//        die();
        $form = $this->createVentasAForm($entity[0]);
        $entity['eventoproductos'] = $em->getRepository('SVentasBundle:EventoProductos')->findOneByIdJoinedToProductosEvento($evento);

        return array(
            'entity'      => $entity,
            'estatus_form' => $form->createView(),
            //'delete_form' => $deleteForm->createView(),
        );
    }
    
    /**
     * Edits an existing Ventas entity.
     *
     * @Route("/e/{id}", name="ventas_update_estatus")
     * @Method("POST")
     * @Template()
     */
    public function estatusAction($id,Request $request)
    {   
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('SVentasBundle:Ventas')->find($id);

        
        if (!$entity) {
            //nicio// controlador
        $request->getSession()->getFlashBag()->add(
        'danger',
          'El empleado no esta registrado');
        return $this->redirect($this->generateUrl('buscar'));
        ///fin
            //throw $this->createNotFoundException('Unable to find Ventas entity.');
        }
        if($request->request->get('s_ventasbundle_ventas')['observacion']!=""){
          $entity->setObservacion($request->request->get('s_ventasbundle_ventas')['observacion']);  
        }
        if($request->request->get('s_ventasbundle_ventas')['monto1']!=""){
            /*$monto=$request->request->get('s_ventasbundle_ventas')['monto1'];
            print_r(dump($monto));
            $english_format_number = number_format( '545454.54' , 2, ",", "." );
            print_r(dump($english_format_number));*/
          $entity->setMonto1($request->request->get('s_ventasbundle_ventas')['monto1']);  
        }
        if($request->request->get('s_ventasbundle_ventas')['monto2']!=""){
          $entity->setMonto2($request->request->get('s_ventasbundle_ventas')['monto2']);  
        }
        if($request->request->get('s_ventasbundle_ventas')['monto3']!=""){
            $entity->setMonto3($request->request->get('s_ventasbundle_ventas')['monto3']);  
        }
         //die("sdd");
        $entity->setEstatus(1);
        
        $entity->setFechaModificacion(new \DateTime);
        $em->flush();
        $request->getSession()->getFlashBag()->add(
        'danger',
          'El empleado Ya retiro el producto');
        return $this->redirect($this->generateUrl('buscar'));
    }

    /**
     * Lists all Noticias entities.
     *
     * @Route("/totalretirados/", name="totalretirados")
     * @Method("GET|POST")
     * @Template()
     */
    public function totalretiradosAction(Request $request)
    {
        $pagination[0]=0;
        $pagination[1]=0;
        $pagination[2]=0;
        $em = $this->getDoctrine()->getManager();
        $evento='';
        if($request->getMethod()=="POST"){
            $evento = $request->request->get('form')['evento'];
            $em = $this->getDoctrine()->getManager();

            $pagination[0]=$em->createQuery('SELECT count(a.idPersonal) as total
          FROM S\VentasBundle\Entity\Ventas a where a.idEventos='.$evento)->getResult();

            $pagination[1]=$em->createQuery('SELECT count(a.idPersonal) as total,a.estatus as estatus
          FROM S\VentasBundle\Entity\Ventas a  
          WHERE a.estatus=0 and  a.idEventos='.$evento.' group by estatus')->getResult();

            $pagination[2]=$em->createQuery('SELECT count(a.idPersonal) as total,a.estatus as estatus
          FROM S\VentasBundle\Entity\Ventas a   
          WHERE a.estatus=1 and  a.idEventos='.$evento.' group by estatus')->getResult();
            // parameters to template

        }
            
        //$entity=$em->createQuery('SELECT a.id as id, a.nombre as nombre
        //FROM S\VentasBundle\Entity\Eventos a')->getResult();
        $user=$this->getUser()->getId();
        $entity=$em->createQuery('SELECT a.id as id, a.nombre as nombre
        FROM S\VentasBundle\Entity\Eventos a , S\VentasBundle\Entity\UserEvento b where b.idEvento=a.id and b.idUser='.$user)->getResult();
        $eventos=array();
        foreach ($entity as $key => $value) { 
            $eventos[$value['id']]=$value['nombre'];
        }
        
        $form = $this->createFormBuilder()
            ->add('evento', 'choice' , array ('choices' => $eventos,'empty_value' => 'Seleccione',
                "required"=> true,))          
            ->setAction($this->generateUrl('totalretirados'))
            ->add('buscar', 'submit', array('label' => 'buscar'))
            ->getForm();
    return $this->render('SVentasBundle:Ventas:indextotal.html.twig', array('evento' => $evento,'pagination' => $pagination,'form' => $form->createView(),));
    }
    
    /**
     * Lists all Noticias entities.
     *
     * @Route("/retirados/{evento}", name="retirados")
     * @Method("GET")
     * @Template()
     */
    public function retiradosAction($evento)
    {
        $em = $this->getDoctrine()->getManager();

        $entities = $em->getRepository('SVentasBundle:Ventas')->findOneByIdJoinedToListarPersonasR($evento);

        if (!$entities) {
            return $this->render('SVentasBundle:Ventas:indexretirados.html.twig', array('pagination' => "0"));
        }  else {
        //Paginador del menu. 
       $paginator  = $this->get('knp_paginator');
       $pagination = $paginator->paginate(
       $entities,
       $this->get('request')->query->get('page', 1)/*page number*/,
        10/*limit per page*/
        );
        }
        
        
        

    // parameters to template
    return $this->render('SVentasBundle:Ventas:indexretirados.html.twig', array('pagination' => $pagination));
    }
    
    /**
     * Lists all Noticias entities.
     *
     * @Route("/noretirados/{evento}", name="noretirados")
     * @Method("GET")
     * @Template()
     */
    public function noretiradosAction($evento)
    {
        $em = $this->getDoctrine()->getManager();

        $entities = $em->getRepository('SVentasBundle:Ventas')->findOneByIdJoinedToListarPersonasNoR($evento);

        if (!$entities) {
            return $this->render('SVentasBundle:Ventas:indexretirados.html.twig', array('pagination' => "0"));
        }  else {
        //Paginador del menu. 
       $paginator  = $this->get('knp_paginator');
       $pagination = $paginator->paginate(
       $entities,
       $this->get('request')->query->get('page', 1)/*page number*/,
        10/*limit per page*/
        );
        }
        
        
        

    // parameters to template
    return $this->render('SVentasBundle:Ventas:indexretirados.html.twig', array('pagination' => $pagination));
    }

    /**
     * Lists all Noticias entities.
     *
     * @Route("/excellnoretirados/{evento}", name="excellnoretirados")
     * @Method("GET")
     * @Template()
     */
    public function excellnoretiradosAction($evento)
    { 
        $em = $this->getDoctrine()->getManager();

        $entities = $em->getRepository('SVentasBundle:Ventas')->ListarPersonasNoRExcell($evento);
//        print_r(dump($entities[0]['tipoPersonal']));
//        die();
        if (!$entities) {
            return $this->render('SVentasBundle:Ventas:indexretirados.html.twig', array('pagination' => "0"));
        }  else {
        // solicitamos el servicio 'phpexcel' y creamos el objeto vacío...
        $phpExcelObject = $this->get('phpexcel')->createPHPExcelObject();

        // ...y le asignamos una serie de propiedades
        $phpExcelObject->getProperties()
            ->setCreator("OPSU")
            ->setLastModifiedBy("OPSU")
            ->setTitle("noretirados")
            ->setSubject("noretirados")
            ->setDescription("Listado de personas no retirados.")
            ->setKeywords("Listado de personas no retirados");

        // establecemos como hoja activa la primera, y le asignamos un título
        $phpExcelObject->setActiveSheetIndex(0);
        $phpExcelObject->getActiveSheet()->setTitle('Ejemplo de exportación');
        
        // escribimos en distintas celdas del documento el título de los campos que vamos a exportar
    $phpExcelObject->setActiveSheetIndex(0);
    $phpExcelObject->getActiveSheet()
          ->setCellValue('A1', 'Cédula')
          ->setCellValue('B1', 'Primer Nombre')
          ->setCellValue('C1', 'Segundo Nombre')
          ->setCellValue('D1', 'Primer Apellido')
          ->setCellValue('E1', 'Segundo Apellido')
          ->setCellValue('F1', 'Tipo Personal')
          ->setCellValue('G1', 'Estatus Nomina')
          ->setCellValue('H1', 'Unidad Administrativa')
          ->setCellValue('I1', 'Ubucación Funcional')
          ->setCellValue('J1', 'Código Nomina')
          ->setCellValue('K1', 'Nomina')
          ->setCellValue('L1', 'Nomina Cestaticket')
          ->setCellValue('M1', 'Estatus')
          ->setCellValue('N1', 'Fecha Modificación')
          ->setCellValue('O1', 'Monto 1')
          ->setCellValue('P1', 'Monto 2')
          ->setCellValue('Q1', 'Monto 3')
          ->setCellValue('R1', 'Observación');
    $phpExcelObject->getActiveSheet()->fromArray($entities, NULL, 'A2');
        // fijamos un ancho a las distintas columnas
         $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('A')
            ->setAutoSize(true)
            ->setWidth(40);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('B')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('C')
            ->setAutoSize(true)
            ->setWidth(25);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('D')
            ->setAutoSize(true)
            ->setWidth(30);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('E')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('F')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('G')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('H')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('I')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('J')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('K')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('L')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('M')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('N')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('O')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('P')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('Q')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('R')
            ->setAutoSize(true)
            ->setWidth(20);

        // se crea el writer
        $writer = $this->get('phpexcel')->createWriter($phpExcelObject, 'Excel5');
        // se crea el response
        $response = $this->get('phpexcel')->createStreamedResponse($writer);
        // y por último se añaden las cabeceras
        $dispositionHeader = $response->headers->makeDisposition(
            ResponseHeaderBag::DISPOSITION_ATTACHMENT,
            'listado_no_retirados.xls'
        );
        $response->headers->set('Content-Type', 'text/vnd.ms-excel; charset=utf-8');
        $response->headers->set('Pragma', 'public');
        $response->headers->set('Cache-Control', 'maxage=1');
        $response->headers->set('Content-Disposition', $dispositionHeader);

        return $response;
        }
    }
    
    /**
     * Lists all Noticias entities.
     *
     * @Route("/excellretirados/{evento}", name="excellretirados")
     * @Method("GET")
     * @Template()
     */
    public function excellretiradosAction($evento)
    { 
        $em = $this->getDoctrine()->getManager();

        $entities = $em->getRepository('SVentasBundle:Ventas')->ListarPersonasRExcell($evento);
    
        if (!$entities) {
            return $this->render('SVentasBundle:Ventas:indexretirados.html.twig', array('pagination' => "0"));
        }  else {
        // solicitamos el servicio 'phpexcel' y creamos el objeto vacío...
        $phpExcelObject = $this->get('phpexcel')->createPHPExcelObject();

        // ...y le asignamos una serie de propiedades
        $phpExcelObject->getProperties()
            ->setCreator("OPSU")
            ->setLastModifiedBy("OPSU")
            ->setTitle("noretirados")
            ->setSubject("noretirados")
            ->setDescription("Listado de personas no retirados.")
            ->setKeywords("Listado de personas no retirados");

        // establecemos como hoja activa la primera, y le asignamos un título
        $phpExcelObject->setActiveSheetIndex(0);
        $phpExcelObject->getActiveSheet()->setTitle('Ejemplo de exportación');
        
        // escribimos en distintas celdas del documento el título de los campos que vamos a exportar
    $phpExcelObject->setActiveSheetIndex(0);
    $phpExcelObject->getActiveSheet()
          ->setCellValue('A1', 'Cédula')
          ->setCellValue('B1', 'Primer Nombre')
          ->setCellValue('C1', 'Segundo Nombre')
          ->setCellValue('D1', 'Primer Apellido')
          ->setCellValue('E1', 'Segundo Apellido')
          ->setCellValue('F1', 'Tipo Personal')
          ->setCellValue('G1', 'Estatus Nomina')
          ->setCellValue('H1', 'Unidad Administrativa')
          ->setCellValue('I1', 'Ubucación Funcional')
          ->setCellValue('J1', 'Código Nomina')
          ->setCellValue('K1', 'Nomina')
          ->setCellValue('L1', 'Nomina Cestaticket')
          ->setCellValue('M1', 'Estatus Retirado')
          ->setCellValue('N1', 'Fecha Modificación')
          ->setCellValue('O1', 'Monto 1')
          ->setCellValue('P1', 'Monto 2')
          ->setCellValue('Q1', 'Monto 3')
          ->setCellValue('R1', 'Observación');
    $phpExcelObject->getActiveSheet()->fromArray($entities, NULL, 'A2');
        // fijamos un ancho a las distintas columnas
         $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('A')
            ->setAutoSize(true)
            ->setWidth(40);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('B')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('C')
            ->setAutoSize(true)
            ->setWidth(25);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('D')
            ->setAutoSize(true)
            ->setWidth(30);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('E')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('F')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('G')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('H')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('I')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('J')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('K')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('L')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('M')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('N')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('O')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('P')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('Q')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('R')
            ->setAutoSize(true)
            ->setWidth(20);

        // se crea el writer
        $writer = $this->get('phpexcel')->createWriter($phpExcelObject, 'Excel5');
        // se crea el response
        $response = $this->get('phpexcel')->createStreamedResponse($writer);
        // y por último se añaden las cabeceras
        $dispositionHeader = $response->headers->makeDisposition(
            ResponseHeaderBag::DISPOSITION_ATTACHMENT,
            'listado_retirados.xls'
        );
        $response->headers->set('Content-Type', 'text/vnd.ms-excel; charset=utf-8');
        $response->headers->set('Pragma', 'public');
        $response->headers->set('Cache-Control', 'maxage=1');
        $response->headers->set('Content-Disposition', $dispositionHeader);

        return $response;
        }
    }
    
    /**
     * Lists all Noticias entities.
     *
     * @Route("/excelltretirados/{evento}", name="excelltretirados")
     * @Method("GET")
     * @Template()
     */
    public function excelltretiradosAction($evento)
    { 
        $em = $this->getDoctrine()->getManager();

        $entities = $em->getRepository('SVentasBundle:Ventas')->ListarPersonasTRExcell($evento);
    
        if (!$entities) {
            return $this->render('SVentasBundle:Ventas:indexretirados.html.twig', array('pagination' => "0"));
        }  else {
        // solicitamos el servicio 'phpexcel' y creamos el objeto vacío...
        $phpExcelObject = $this->get('phpexcel')->createPHPExcelObject();

        // ...y le asignamos una serie de propiedades
        $phpExcelObject->getProperties()
            ->setCreator("OPSU")
            ->setLastModifiedBy("OPSU")
            ->setTitle("noretirados")
            ->setSubject("noretirados")
            ->setDescription("Listado de personas no retirados.")
            ->setKeywords("Listado de personas no retirados");

        // establecemos como hoja activa la primera, y le asignamos un título
        $phpExcelObject->setActiveSheetIndex(0);
        $phpExcelObject->getActiveSheet()->setTitle('Ejemplo de exportación');
        
        // escribimos en distintas celdas del documento el título de los campos que vamos a exportar
    $phpExcelObject->setActiveSheetIndex(0);
    $phpExcelObject->getActiveSheet()
          ->setCellValue('A1', 'Cédula')
          ->setCellValue('B1', 'Primer Nombre')
          ->setCellValue('C1', 'Segundo Nombre')
          ->setCellValue('D1', 'Primer Apellido')
          ->setCellValue('E1', 'Segundo Apellido')
          ->setCellValue('F1', 'Tipo Personal')
          ->setCellValue('G1', 'Estatus Nomina')
          ->setCellValue('H1', 'Unidad Administrativa')
          ->setCellValue('I1', 'Ubucación Funcional')
          ->setCellValue('J1', 'Código Nomina')
          ->setCellValue('K1', 'Nomina')
          ->setCellValue('L1', 'Nomina Cestaticket')
          ->setCellValue('M1', 'Estatus Retirado')
          ->setCellValue('N1', 'Fecha Modificación')
          ->setCellValue('O1', 'Monto 1')
          ->setCellValue('P1', 'Monto 2')
          ->setCellValue('Q1', 'Monto 3')
          ->setCellValue('R1', 'Observación');
    $phpExcelObject->getActiveSheet()->fromArray($entities, NULL, 'A2');
        // fijamos un ancho a las distintas columnas
         $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('A')
            ->setAutoSize(true)
            ->setWidth(40);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('B')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('C')
            ->setAutoSize(true)
            ->setWidth(25);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('D')
            ->setAutoSize(true)
            ->setWidth(30);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('E')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('F')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('G')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('H')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('I')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('J')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('K')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('L')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('M')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('N')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('O')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('P')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('Q')
            ->setAutoSize(true)
            ->setWidth(20);
        $phpExcelObject->setActiveSheetIndex(0)
            ->getColumnDimension('R')
            ->setAutoSize(true)
            ->setWidth(20);

        // se crea el writer
        $writer = $this->get('phpexcel')->createWriter($phpExcelObject, 'Excel5');
        // se crea el response
        $response = $this->get('phpexcel')->createStreamedResponse($writer);
        // y por último se añaden las cabeceras
        $dispositionHeader = $response->headers->makeDisposition(
            ResponseHeaderBag::DISPOSITION_ATTACHMENT,
            'listado_personas.xls'
        );
        $response->headers->set('Content-Type', 'text/vnd.ms-excel; charset=utf-8');
        $response->headers->set('Pragma', 'public');
        $response->headers->set('Cache-Control', 'maxage=1');
        $response->headers->set('Content-Disposition', $dispositionHeader);

        return $response;
        }
    }
    
    /**
     * Creates a new Ventas entity.
     *
     * @Route("/cargar/", name="cargar_ventas_create")
     * @Method("GET|POST")
     * @Template("SVentasBundle:Ventas:cargar.html.twig")
     */
    public function cargarCreateAction(Request $request)
    {   $entity='';
        $form = $this->createFormBuilder()
            ->add('archivo', 'file', array('label' => 'Adjuntar Archivo (formato csv separado , ): ','data_class' => null,  "required"=> true ))      
            ->setAction($this->generateUrl('cargar_ventas_create'))
            ->add('buscar', 'submit', array('label' => 'Registrar'))
            ->getForm();
        $listanopersonalregistrado=array();
        $noeventoregistrado=array();
        $registrado=array();
        $agregadas=array();

        if($request->getMethod()=="POST"){
            
            $form->handleRequest($this->getRequest());
            $uploaded_file = $form['archivo']->getData();
            //print_r(dump($uploaded_file));

            $csv=$this->leerCSV($uploaded_file);
            //print_r($csv);
            //die();
            $p=$e=$per=$pen=0; 
            //print_r(dump($csv));
            //    die();
            
            foreach ($csv as $key =>$value) {
                $bandera=0;
                
                //$value=split(';', $value[0]);;
            
                $entity = new Ventas();
                $em = $this->getDoctrine()->getManager();
                $Personal = $em->getRepository('SVentasBundle:Personas')->findByCedula($value[0]);
                
                if(!$Personal){
                    $listanopersonalregistrado[$p]['cedula']=$value[0];
                    $listanopersonalregistrado[$p]['eventos']=$value[1];
                    $bandera=1;
                    $p++;
                }else{
                    $Personal=$Personal[0];
                }
                $Eventos = $em->getRepository('SVentasBundle:Eventos')->findById($value[1]);
                if(!$Eventos){
                    $noeventoregistrado[$e]['cedula']=$value[0];
                    $noeventoregistrado[$e]['eventos']=$value[1];
                    $e++;
                    $bandera=1;
                }else{
                    $Eventos=$Eventos[0];
                }
                
                if($bandera==0){
                    $Evento = $em->getRepository('SVentasBundle:Ventas')->findOneBy(array('idEventos'=>$value[1],'idPersonal'=>$Personal->getId()));
                   
                    if($Evento){
                        $registrado[$per]['cedula']=$value[0];
                        $registrado[$per]['eventos']=$value[1];
                        $per++;
                        $bandera=0;
                    }else{
                            $entity->setIdPersonal($Personal);
                            $entity->setIdEventos($Eventos);
                            $entity->setEstatus('0');
                            $em->persist($entity);
                            $em->flush();
                            $agregadas[$pen]['cedula']=$value[0];
                            $agregadas[$pen]['eventos'][]=$value[1];
                            $pen++;
                    }
                }
            }
        }
        

        return array(
            'entity' => $entity,
            'agregadas' =>$agregadas,
            'listanopersonalregistrado' =>$listanopersonalregistrado,
            'noeventoregistrado' =>$noeventoregistrado,
            'registrado' =>$registrado,
            'form'   => $form->createView(),
        );
    }

    public static function leerCSV(UploadedFile $uploaded_file)
    {
       $path="/var/www/html/sventas.opsu.gob.ve/web/archivocsv/";
        $uploaded_file_info = pathinfo($uploaded_file->getClientOriginalName());
        $hoy = date("Y-m-d,H:i:s");
        $file_name=$uploaded_file_info['filename'].$hoy.$uploaded_file_info['extension'];
        $uploaded_file->move($path,$file_name);
        $csv = array_map('str_getcsv', file($path.$file_name));
        array_shift($csv); # remove column header
        return $csv;
    }

    /**
     * Creates a new Ventas entity.
     *
     * @Route("/agregarlista/{idEvento}", name="agregarlista")
     */
    public  function agregarlistaAction($idEvento)
    {
        $em = $this->getDoctrine()->getManager();
        $Evento = $em->getRepository('SVentasBundle:Eventos')->findById($idEvento);
        if($Evento){
            
            $p=$e=$per=$pen=0; 
            $Personal = $em->getRepository('SVentasBundle:Personas')->findByEstatus(1);
            foreach ($Personal as $key =>$Personas) {
                $entity = new Ventas();
                $em2 = $this->getDoctrine()->getManager();
                $Eventos = $em2->getRepository('SVentasBundle:Ventas')->findOneBy(array('idEventos'=>$idEvento,'idPersonal'=>$Personas->getId()));
                if(!$Eventos or $Eventos==null){
                        $entity->setIdPersonal($Personas);
                        
                        $entity->setIdEventos($Evento[0]);
                        $entity->setEstatus('0');
                        $em->persist($entity);
                        $em->flush();

                }
            }
        }
        

        return $this->redirect($this->generateUrl('eventos'));
    }
    
    /**
     * Displays a form to create a new Ventas entity.
     *
     * @Route("/listaPerEventonew/", name="listaPerEventonew")
     * @Method("GET")
     * @Template()
     */
    public function listaPerEventonewAction()
    {
        
        $em = $this->getDoctrine()->getManager();
        //$user=$this->getUser()->getRoles()[0];
        $user=$this->getUser()->getId();
        $entity=$em->createQuery('SELECT a.id as id, a.nombre as nombre
        FROM S\VentasBundle\Entity\Eventos a , S\VentasBundle\Entity\UserEvento b where b.idEvento=a.id and b.idUser='.$user)->getResult();
        $eventos=array();
        foreach ($entity as $key => $value) {
            $eventos[$value['id']]=$value['nombre'];
        }
        $form = $this->createFormBuilder()
            ->add('tipoPersonal' , 'choice' , array (
            'choices' => array ('0' => 'Externo', '1' => 'Empleado Fijo', '2' => 'Empleado Contratado', '3' => 'Obrero Fijo'
                , '4' => 'Obrero Contratado', '5' => 'Docente Fijo', '6' => 'Docente Contratado', '7' => 'Jubilado', '8' => 'Comision de Servicios'
                , '9' => 'Libre Nombramiento', '10' => 'Militar', '11' => 'Honorarios Profesionales', '12' => 'Pensionado', '13' => 'Suplente'
                , '14' => 'Contratado', '15' => 'Incapacitados')
                ,'expanded'=>'1'
                ,'multiple'=>true
                    ))
            ->add('evento', 'choice' , array ('choices' => $eventos,
                "required"=> true,))          
            ->setAction($this->generateUrl('agregarlistatipoPersonal'))
            ->add('guardar', 'submit', array('label' => 'Guardar'))
            ->getForm();

        return array(
            'entity' => $entity,
            'form'   => $form->createView(),
        );
    }
    
    /**
     * Creates a new Ventas entity.
     *
     * @Route("/agregarlistatipoPersonal/", name="agregarlistatipoPersonal")
     * @Method("GET|POST")
     */
    public  function agregarlistatipoPersonalAction(Request $request)
    {
        
        
        $em = $this->getDoctrine()->getManager();
        //$user=$this->getUser()->getRoles()[0];
        $idEvento=$request->request->get('form')['evento'];
        $tipoPersonal=$request->request->get('form')['tipoPersonal'];
        $user=$this->getUser()->getId();
        
        $em = $this->getDoctrine()->getManager();
        $Evento = $em->getRepository('SVentasBundle:Eventos')->findById($idEvento);
        if($Evento){
            
            $p=$e=$per=$pen=0; 
            //$Personal = $em->getRepository('SVentasBundle:Personas')->findByEstatus(1);
            $Personal = $em->getRepository('SVentasBundle:Personas')->findBy(array('estatus'=>1,'tipoPersonal'=>$tipoPersonal));
            foreach ($Personal as $key =>$Personas) {
                $entity = new Ventas();
                $em2 = $this->getDoctrine()->getManager();
                $Eventos = $em2->getRepository('SVentasBundle:Ventas')->findOneBy(array('idEventos'=>$idEvento,'idPersonal'=>$Personas->getId()));
                if(!$Eventos or $Eventos==null){
                        $entity->setIdPersonal($Personas);
                        
                        $entity->setIdEventos($Evento[0]);
                        $entity->setEstatus('0');
                        $em->persist($entity);
                        $em->flush();

                }
            }
        }
        

        return $this->redirect($this->generateUrl('eventos'));
    }
}
