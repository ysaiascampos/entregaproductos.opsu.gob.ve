<?php

namespace S\VentasBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use S\VentasBundle\Entity\EventoProductos;
use S\VentasBundle\Form\EventoProductosType;
use Doctrine\ORM\EntityRepository;

/**
 * EventoProductos controller.
 *
 * @Route("/eventoproductos")
 */
class EventoProductosController extends Controller
{

    /**
     * Lists all EventoProductos entities.
     *
     * @Route("/", name="eventoproductos")
     * @Method("GET")
     * @Template()
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $entities = $em->getRepository('SVentasBundle:EventoProductos')->findAll();
        
        //Paginador del menu. 
        $paginator  = $this->get('knp_paginator');
        $pagination = $paginator->paginate(
        $entities,
        $this->get('request')->query->get('page', 1)/*page number*/,
         10/*limit per page*/);
        // parameters to template
        return $this->render('SVentasBundle:EventoProductos:index.html.twig', array('pagination' => $pagination));
    }
    /**
     * Creates a new EventoProductos entity.
     *
     * @Route("/", name="eventoproductos_create")
     * @Method("POST")
     * @Template("SVentasBundle:EventoProductos:new.html.twig")
     */
    public function createAction(Request $request)
    {
        $entity = new EventoProductos();
        $form = $this->createCreateForm($entity);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($entity);
            $em->flush();
            $bitacora = $em->getRepository('SVentasBundle:Bitacora')->crear('EventoProductos',$entity->getId(),$entity,$this->getUser()->getId(),$_SERVER['REMOTE_ADDR']);
            $em->persist($bitacora); 
            $em->flush();

            return $this->redirect($this->generateUrl('eventoproductos_show', array('id' => $entity->getId())));
        }

        return array(
            'entity' => $entity,
            'form'   => $form->createView(),
        );
    }

    /**
     * Creates a form to create a EventoProductos entity.
     *
     * @param EventoProductos $entity The entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createCreateForm(EventoProductos $entity)
    {
        $form = $this->createForm(new EventoProductosType(), $entity, array(
            'action' => $this->generateUrl('eventoproductos_create'),
            'method' => 'POST',
        ));

        $form->add('submit', 'submit', array('label' => 'Crear','attr' => array('class' => 'btn btn-default')));

        return $form;
    }

    /**
     * Displays a form to create a new EventoProductos entity.
     *
     * @Route("/new", name="eventoproductos_new")
     * @Method("GET")
     * @Template()
     */
    public function newAction()
    {
        $entity = new EventoProductos();
        $form   = $this->createCreateForm($entity);
        if('ROLE_SUPER_ADMIN'==$this->getUser()->getRoles()[0]){
            $form->add('idEvento', 'entity', array(
                'label' => 'Evento ','empty_value' => 'Seleccione',  "required"=> true,
                'class' => 'S\VentasBundle\Entity\Eventos',
                'query_builder' => function(EntityRepository $er ){
                    return $er->createQueryBuilder('w')
                  ->orderBy('w.id', 'ASC');
              }));
        }else{
            $form->add('idEvento', 'entity', array(
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
     * Finds and displays a EventoProductos entity.
     *
     * @Route("/{id}", name="eventoproductos_show")
     * @Method("GET")
     * @Template()
     */
    public function showAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('SVentasBundle:EventoProductos')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find EventoProductos entity.');
        }

        $deleteForm = $this->createDeleteForm($id);

        return array(
            'entity'      => $entity,
            'delete_form' => $deleteForm->createView(),
        );
    }

    /**
     * Displays a form to edit an existing EventoProductos entity.
     *
     * @Route("/{id}/edit", name="eventoproductos_edit")
     * @Method("GET")
     * @Template()
     */
    public function editAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('SVentasBundle:EventoProductos')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find EventoProductos entity.');
        }

        $editForm = $this->createEditForm($entity);
        $deleteForm = $this->createDeleteForm($id);

        return array(
            'entity'      => $entity,
            'form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        );
    }

    /**
    * Creates a form to edit a EventoProductos entity.
    *
    * @param EventoProductos $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createEditForm(EventoProductos $entity)
    {
        $form = $this->createForm(new EventoProductosType(), $entity, array(
            'action' => $this->generateUrl('eventoproductos_update', array('id' => $entity->getId())),
            'method' => 'PUT',
        ));

        $form->add('submit', 'submit', array('label' => 'Editar','attr' => array('class' => 'btn btn-default')));

        return $form;
    }
    /**
     * Edits an existing EventoProductos entity.
     *
     * @Route("/{id}", name="eventoproductos_update")
     * @Method("PUT")
     * @Template("SVentasBundle:EventoProductos:edit.html.twig")
     */
    public function updateAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('SVentasBundle:EventoProductos')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find EventoProductos entity.');
        }

        $deleteForm = $this->createDeleteForm($id);
        $editForm = $this->createEditForm($entity);
        if('ROLE_SUPER_ADMIN'==$this->getUser()->getRoles()[0]){
            $editForm->add('idEvento', 'entity', array(
                'label' => 'Evento ','empty_value' => 'Seleccione',  "required"=> true,
                'class' => 'S\VentasBundle\Entity\Eventos',
                'query_builder' => function(EntityRepository $er ){
                    return $er->createQueryBuilder('w')
                  ->orderBy('w.id', 'ASC');
              }));
        }else{
            $editForm->add('idEvento', 'entity', array(
                'label' => 'Evento ','empty_value' => 'Seleccione',  "required"=> true,
                'class' => 'S\VentasBundle\Entity\Eventos',
                'query_builder' => function(EntityRepository $er ){
                    return $er->createQueryBuilder('w')
                  ->orderBy('w.id', 'ASC')
                  ->where("w.rolesUsuario='".$this->getUser()->getRoles()[0]."'");
              }));
        }
        
        $editForm->handleRequest($request);

        if ($editForm->isValid()) {
            $em->flush();
            $bitacora = $em->getRepository('SVentasBundle:Bitacora')->editar('EventoProductos',$entity->getId(),$entity,$this->getUser()->getId(),$_SERVER['REMOTE_ADDR']);
            $em->persist($bitacora); 
            $em->flush();

            return $this->redirect($this->generateUrl('eventoproductos_edit', array('id' => $id)));
        }

        return array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        );
    }
    /**
     * Deletes a EventoProductos entity.
     *
     * @Route("/{id}", name="eventoproductos_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, $id)
    {
        $form = $this->createDeleteForm($id);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $entity = $em->getRepository('SVentasBundle:EventoProductos')->find($id);

            if (!$entity) {
                throw $this->createNotFoundException('Unable to find EventoProductos entity.');
            }
            $em2 = $this->getDoctrine()->getManager();
            $bitacora = $em2->getRepository('SVentasBundle:Bitacora')->eliminar('EventoProductos',$entity->getId(),$entity,$this->getUser()->getId(),$_SERVER['REMOTE_ADDR']);
            $em2->persist($bitacora); 
            $em->remove($entity);
            $em->flush();
        }

        return $this->redirect($this->generateUrl('eventoproductos'));
    }

    /**
     * Creates a form to delete a EventoProductos entity by id.
     *
     * @param mixed $id The entity id
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm($id)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('eventoproductos_delete', array('id' => $id)))
            ->setMethod('DELETE')
            ->add('submit', 'submit', array('label' => 'Eliminar','attr' => array('class' => 'btn btn-default')))
            ->getForm()
        ;
    }
}
